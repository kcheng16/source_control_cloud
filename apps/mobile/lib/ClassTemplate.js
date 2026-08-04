class PendingJob {
  constructor(fromApp, fromPage, fromComponent, 
              payload, spToCall, parameters, metaData, 
              entity_name, display_name, 
              dependencyID, dependencyFieldName) {

    this.context = {
      app: fromApp,
      page: fromPage,
      component: fromComponent
    },

    this.dbOperation = {
      spToCall: spToCall,
      parameters: parameters
    },

    this.operationDependency = {
      jobId: dependencyID,
      field_name: dependencyFieldName
    };

    this.payload = payload,
    this.metaData = metaData,
    this.display_name = display_name;
    this.entity_name = entity_name;

    this.id = PendingJob.generateUUID();
    this.createDate = moment().format("yyyy-MM-D HH:mm:ss");
    this.status = 'PENDING';
    
    this.processingStart = undefined;
    this.processingEnd = undefined;
    this.result = undefined;
  }

  static generateUUID() {
      return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, c => {
          const r = Math.random() * 16 | 0;
          const v = c === 'x' ? r : (r & 0x3 | 0x8);
          return v.toString(16);
      });
  }

  static postgreSPToObject(sql) {
    const result = {
      procedure_name: null,
      parameters: {}
    };
  
    // Extract procedure name after CALL and before '('
    const procMatch = sql.match(/CALL\s+([a-zA-Z0-9_.]+)\s*\(/i);
    if (procMatch) {
      result.procedure_name = procMatch[1];
    }
  
    // Extract everything inside the parentheses
    const inner = sql.replace(/^[\s\S]*?\(/, "").replace(/\)[\s\S]*$/, "");
  
    // Split by lines to avoid breaking on commas inside values
    const lines = inner.split(/\r?\n/);
  
    for (let rawLine of lines) {
      const line = rawLine.trim();
      if (!line) continue;
  
      // Remove trailing comma
      const cleaned = line.replace(/,$/, "");
  
      // Match: param_name => value
      const match = cleaned.match(/^([a-zA-Z0-9_]+)\s*=>\s*(.*)$/);
      if (!match) continue;
  
      const key = match[1];
      let rawValue = match[2].trim();
  
      // Extract ::TYPE if present
      let data_type = null;
      const typeMatch = rawValue.match(/^(.*?)(::[a-zA-Z0-9_]+)$/);
      if (typeMatch) {
        rawValue = typeMatch[1].trim();
        data_type = typeMatch[2].replace("::", "");
      }
  
      // Determine JS value
      let value;
  
      // Empty → undefined
      if (rawValue === "" || rawValue === "null") {
        value = undefined;
      }
      // Quoted string
      else if (
        (rawValue.startsWith("'") && rawValue.endsWith("'")) ||
        (rawValue.startsWith('"') && rawValue.endsWith('"'))
      ) {
        value = rawValue.slice(1, -1);
      }
      // Boolean
      else if (rawValue === "true") {
        value = true;
      }
      else if (rawValue === "false") {
        value = false;
      }
      // Otherwise treat as literal (UUID, number, date, etc.)
      else {
        value = rawValue;
      }
  
      result.parameters[key] = {
        value,
        data_type
      };
    }
  
    return result;
  }


  static objectToSP(procedure_name, parameters) {
    const lines = [];
  
    for (const [key, { value, data_type }] of Object.entries(parameters)) {
      let formatted;
  
      // undefined/null → empty
      if (value === undefined || value === null) {
        formatted = "NULL";
      }
      // boolean
      else if (typeof value === "boolean") {
        formatted = value ? "true" : "false";
      }
      // number
      else if (typeof value === "number") {
        formatted = value.toString();
      }
      // string
      else if (typeof value === "string") {
        const escaped = value.replace(/'/g, "''");
        formatted = `'${escaped}'`;
      }
      // object/array fallback → JSON
      else {
        const json = JSON.stringify(value).replace(/'/g, "''");
        formatted = `'${json}'`;
      }
  
      // Append ::TYPE if present
      if (data_type) {
        formatted += `::${data_type}`;
      }
  
      lines.push(`  ${key} => ${formatted}`);
    }
  
    return `CALL ${procedure_name}(\n${lines.join(",\n")}\n)`;
  }

}

class JobQueue {

  static get QUEUE_KEY() {
    return "cf_job_queue";
  }

  static async processJob(job)
  {
    //Could either send this to backend SQL Processing or use front-end
    let statement = PendingJob.objectToSP(job.dbOperation.spToCall, job.dbOperation.parameters);

    /*This need to exist */
    let result = await call_process_dynamic_procedure_call.trigger({
      additionalScope:{
        queryString: statement
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

  static getJob()
  {
    
  }

  static deleteJob(job)
  {
    
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

  static isOffline()
  {
    return retoolContext.networkStatus != 'CONNECTED' || true;
  }
}