let siteValid = {{ trnIsValid_SamplingSite.value.length == 0 }};
let resultValid = {{ trnIsValid_YearlyData.value.length == 0 || !chkAddResultData.value}};
let resultMessage = {{ trnIsValid_YearlyData.value }};

let errorMessage = [];

if (!siteValid)
  errorMessage.push("• Sampling site: please fill in fields with *");

if (!resultValid)
{
  errorMessage.push(...resultMessage);
  //errorMessage.push("Numbers in yearly result data cannot be negative.");
  //errorMessage.push("Plant diversities, top soil depth, rest/graze per year, and slaking needs to be greater than 0");
}

return errorMessage;