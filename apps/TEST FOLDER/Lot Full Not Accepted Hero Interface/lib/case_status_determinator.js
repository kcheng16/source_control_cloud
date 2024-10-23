const currentStatus = {{getCaseNumber.data['0'].Status}};

if ( currentStatus === "Pending - Automation" || currentStatus === "Pending - Customer"){
  return {
    status: currentStatus
  }
} else {
  return {
    status: "Solved"
  }
}