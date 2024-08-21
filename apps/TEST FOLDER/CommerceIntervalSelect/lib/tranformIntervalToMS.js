switch ({{interval.value}}){
  case 'day':
    return moment.duration(1, 'days').asMilliseconds()
  case 'week':
    return moment.duration(1, 'weeks').asMilliseconds()
  case 'month':
    return moment.duration(1, 'months').asMilliseconds()
  case 'year':
    return moment.duration(1, 'years').asMilliseconds()
}