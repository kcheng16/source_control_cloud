const currentTime = new moment();
const startTime = new moment( {{ timeBasedMessages.data.data.time_based_getting_here_from }} ).subtract(24, 'h');
const endTime = new moment( {{ timeBasedMessages.data.data.time_based_getting_here_to }} ).add(24, 'h');

return currentTime.isBetween( startTime, endTime )

