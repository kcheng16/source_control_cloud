class PendingJob {
  constructor(
    fromApp, 
    fromPage, 
    fromComponent, 
              
    payload, 
    friendlyPayload,
    spToCall, 
    parameters, 
    metaData, 
              
    entity_name, 
    entity_id,
              
    display_name, 
    display_body,
              
    dependencyID, 
    dependencyFieldName,

    readyToUpload
  ) {

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

    this.entity = {
      id: entity_id,
      name: entity_name
    };

    this.friendlyPayload = friendlyPayload,
    this.payload = payload,
    this.metaData = metaData,
    this.display_name = display_name;
    this.display_body = display_body;

    this.id = PendingJob.generateUUID();
    this.createDate = moment().format("yyyy-MM-D HH:mm:ss");
    this.status = 'PENDING';
    
    this.processingStart = undefined;
    this.processingEnd = undefined;
    this.result = undefined;

    this.readyToUpload = readyToUpload;

    this.jobNo = (localStorage.getValue("cf_job_queue")?.length || 0) + 1;
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
      const typeMatch = rawValue.match(/^(.*?)(::.+)$/
);
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

switch (methodToCall)
{
  case "constructor":
    let newJob = new PendingJob(
      jsonParameters.fromApp,
      jsonParameters.fromPage,
      jsonParameters.fromComponent,
      jsonParameters.payload,
      jsonParameters.friendlyPayload,
      jsonParameters.spToCall,
      jsonParameters.parameters,
      jsonParameters.metaData,
      jsonParameters.entity_name,
      jsonParameters.entity_id,
      jsonParameters.display_name,
      jsonParameters.display_body,
      jsonParameters.dependencyID,
      jsonParameters.dependencyFieldName,
      jsonParameters.readyToUpload
    );
    return newJob;
    
  case "postgreSPToObject":
    return PendingJob.postgreSPToObject(jsonParameters.sql);
  case "objectToSP":
    return PendingJob.objectToSP(
      jsonParameters.procedure_name,
      jsonParameters.parameters
    );
}