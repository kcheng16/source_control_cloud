// Tip: assign your external references to variables instead of chaining off the curly brackets.
//START TIME
const start_time = {{getSingleRentalTransaction.data.data.results['0'].starts}};
const startInput = `${start_time} UTC`;
const startTime = new Date(startInput);
const starts = startTime.toISOString().slice(0,-8);

//END TIME
const end_time = {{getSingleRentalTransaction.data.data.results['0'].ends}};
const endInput =  `${end_time} UTC`;
const endTime = new Date(endInput);
const ends = endTime.toISOString().slice(0,-8);

const url_formatted_times = `starts=${starts}&ends=${ends}`;
return url_formatted_times;
