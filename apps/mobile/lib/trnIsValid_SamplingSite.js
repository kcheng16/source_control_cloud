let data = {{ trnSiteData.value }};
let error = [];

if (data.site_name == '')
  error.push("Please enter site name");

if (data.sample_taken_date == '')
  error.push("Please enter sample taken date");

if (data.latitude == undefined || data.latitude == '')
  error.push("Please enter valid latitude");

if (data.longitude == undefined || data.longitude == '')
  error.push("Please enter valid longitude");

if (data.paddock_use_as == '' || data.paddock_use_as == undefined)
  error.push("Please enter the paddock use as field");
else if (data.paddock_use_as == 'use_as_other' && data.paddock_use_as_other == '')
  error.push("Please enter the paddock use as field");
  
  

return error;