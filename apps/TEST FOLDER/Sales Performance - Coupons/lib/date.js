// Reference external variables with curly brackets or using JS variables

const startDate = moment({{dateFilters.startDate}})
const endDate = moment({{dateFilters.endDate}})

const format = (date) => date.format('YYYY-MM-DD');
const subtractTimeDiff = (date) => moment(date).subtract(moment(endDate).diff(startDate));

return {
  past:{
    start: format(subtractTimeDiff(startDate)),
    end: format(subtractTimeDiff(endDate.add(1,'days')))
  },
  current:{
    start: format(startDate),
    end: format(endDate.add(1,'days'))
  }
}