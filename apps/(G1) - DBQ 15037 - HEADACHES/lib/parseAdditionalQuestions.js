let dbqFormQuestions = getDBQFormQuestion.data
let formAdditionalQuestions = getForm.data?.additional_questions?.[0]
let formattedRemarks = null
let parseInterface = null
let currentFormattedRemarks = {}

if(!formAdditionalQuestions || Object.keys(formAdditionalQuestions)?.length == 0) {
  if(!!additionalQuestions.value) { 

        additionalQuestions.value?.forEach(q => {
        currentFormattedRemarks[q.Ques__c] = q.answer
      })
      parseInterface = additionalQuestions.value
  } else {

     parseInterface = dbqFormQuestions.map(q => {q.answer = null; return q;})
  
    let initialFormattedRemarks = {}
    dbqFormQuestions.forEach(q => {
      initialFormattedRemarks[q.Ques__c] = ""
    })
    formattedRemarks = initialFormattedRemarks
  }
} else { 

  
  if(!!additionalQuestions.value) { 

        additionalQuestions.value?.forEach(q => {
        currentFormattedRemarks[q.Ques__c] = q.answer
      })
      parseInterface = additionalQuestions.value
  } else {

    let currentFormAdditionalQuestions = dbqFormQuestions?.map(dfq => {dfq.answer = formAdditionalQuestions.find(f => f.Id == dfq.Id)?.answer; return dfq;})
         
    parseInterface = currentFormAdditionalQuestions
    currentFormAdditionalQuestions?.forEach(q => {
        currentFormattedRemarks[q.Ques__c] = q.answer
      })
  }
  
}

formattedRemarks = currentFormattedRemarks

return {
  parseInterface: parseInterface,
  formattedRemarks: formattedRemarks
}