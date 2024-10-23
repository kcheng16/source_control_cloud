const blackoutRequestObj = {
  endpoint : {{createBlackout.data.metadata.request.url}},
  retoolUser : `retool@spothero.com`,
  heroUser : {{current_user.email}},
  timeOfCall : new Date({{createBlackout.requestSentTimestamp}}),
  responseMessage : {{createBlackout.data.message}},
  statusCode : {{createBlackout.data.metadata.status}}
}

const cancelAsCreditRequestObj = {
  endpoint : {{cancelReservationAsCredit.data.metadata.request.url}},
  retoolUser : `retool@spothero.com`,
  heroUser : {{current_user.email}},
  timeOfCall : new Date({{cancelReservationAsCredit.requestSentTimestamp}}),
  responseMessage : {{cancelReservationAsCredit.data.message}},
  statusCode : {{cancelReservationAsCredit.data.metadata.status}}
}

const cancelAsOriginRequestObj = {
  endpoint : {{cancelReservationOriginalSource.data.metadata.request.url}},
  retoolUser : `retool@spothero.com`,
  heroUser : {{current_user.email}},
  timeOfCall : new Date({{cancelReservationOriginalSource.requestSentTimestamp}}),
  responseMessage : {{cancelReservationOriginalSource.data.message}},
  statusCode : {{cancelReservationOriginalSource.data.metadata.status}}
}

const creditRequestObj = {
  endpoint : {{addCreditToUser.data.metadata.request.url}},
  retoolUser : `retool@spothero.com`,
  heroUser : {{current_user.email}},
  timeOfCall : new Date({{addCreditToUser.requestSentTimestamp}}),
  responseMessage : {{addCreditToUser.data.message}},
  statusCode : {{addCreditToUser.data.metadata.status}}
}

const successObj = {
  blackoutRequestObj,
  cancelAsOriginRequestObj,
  cancelAsCreditRequestObj,
  creditRequestObj
}

return successObj