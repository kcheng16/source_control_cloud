class JobQueue {

  static get QUEUE_KEY() {
    return "cf_job_queue";
  }

  static async processJob(job)
  {
    //Could either send this to backend SQL Processing or use front-end
    /*let statement = await PendingJobClass.trigger({
      additionalScope:{
        methodToCall: "objectToSP",
        jsonParameters: {
          procedure_name: job.dbOperation.spToCall,
          parameters: job.dbOperation.parameters
        }
      }
    });*/

    /*This need to exist */
    let result = await call_process_dynamic_procedure_call.trigger({
      additionalScope:{
        procedureName: job.dbOperation.spToCall,
        parameters: job.dbOperation.parameters
      }
    });
    
    job.result = result;

    if (result.startsWith("Error"))
      job.status = "FAILED";
    else
      job.status = "FINISHED";
    
    JobQueue.updateJob(job);

    return result;
  }
  
  static addJob(job)
  {
    //Need to check if ID is unique or not
    
    let jobQueue = localStorage.getValue(this.QUEUE_KEY) || [];
    jobQueue.push(job);

    localStorage.setValue(this.QUEUE_KEY, jobQueue);
  }

  static updateJob(job)
  {
    //Need to check if ID is unique or not
    
    let jobQueue = localStorage.getValue(this.QUEUE_KEY) || [];
    let index = jobQueue.findIndex((x) => x.id == job.id);

    if (index > -1)
      jobQueue[index] = job;

    localStorage.setValue(this.QUEUE_KEY, jobQueue);
  }

  static getJobByJobId(id)
  {
    let jobQueue = localStorage.getValue(this.QUEUE_KEY) || [];

    return jobQueue.filter((x) => x.id == id)[0];
  }

  static getJobByEntity(entity_id, entity_name)
  {
    let jobQueue = localStorage.getValue(this.QUEUE_KEY) || [];

    return jobQueue.filter((x) => x.entity.id == entity_id && x.entity.name == entity_name)[0];
  }

  static deleteJob(job)
  {
    let jobQueue = localStorage.getValue(this.QUEUE_KEY) || [];
    jobQueue = jobQueue.filter((x) => x.id != job.id);

    localStorage.setValue(this.QUEUE_KEY, jobQueue);
  }

  static clearAllQueue()
  {
    localStorage.setValue(this.QUEUE_KEY, undefined);
  }

  static getPendingJobs()
  {
    let jobQueue = localStorage.getValue(this.QUEUE_KEY) || [];

    return jobQueue.filter((x) => x.status == 'PENDING');
  }

  static getFailedJobs()
  {
    let jobQueue = localStorage.getValue(this.QUEUE_KEY) || [];

    return jobQueue.filter((x) => x.status == 'FAILED');
  }

  static getFinishedJobs()
  {
    let jobQueue = localStorage.getValue(this.QUEUE_KEY) || [];

    return jobQueue.filter((x) => x.status == 'FINISHED');
  }

  static isOffline()
  {
    return retoolContext.networkStatus != 'CONNECTED' || true;
  }
}


switch (methodToCall) {

    case "addJob":
      return JobQueue.addJob(jsonParameter.job);

    case "updateJob":
      return JobQueue.updateJob(jsonParameter.job);

    case "deleteJob":
      return JobQueue.deleteJob(jsonParameter.job);

    case "getPendingJobs":
      return JobQueue.getPendingJobs();

    case "clearAllQueue":
      return JobQueue.clearAllQueue();

    case "processJob":
      return JobQueue.processJob(jsonParameter.job);

    case "getJobByJobId":
      return JobQueue.getJobByJobId(jsonParameter.id);

    case "getJobByEntity":
      return JobQueue.getJobByEntity(jsonParameter.entity_id, jsonParameter.entity_name);

    case "isOffline":
      return JobQueue.isOffline();

  }