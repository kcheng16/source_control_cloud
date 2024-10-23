const wrongStart = {{dateRange1.value.start}};
const wrongEnd = {{dateRange1.value.end}};

const currentDay = new Date().toISOString().slice(0, 10).split('-');
const thirtyDayAgoMilli = Date.parse(new Date()) - ( 1000 * 60 * 60 * 24 * 30 );
const thirtyDaysAgoDay = new Date(thirtyDayAgoMilli).toISOString().slice(0,10).split('-');
const defaultStart30 = `${thirtyDaysAgoDay[1]}-${thirtyDaysAgoDay[2]}-${thirtyDaysAgoDay[0]}`;
const defaultEnd = `${currentDay[1]}-${currentDay[2]}-${currentDay[0]}`;

const startArr = wrongStart.split('-');
let start = `${startArr[1]}-${startArr[2]}-${startArr[0]}`;

const endArr = wrongEnd.split('-');
let end = `${endArr[1]}-${endArr[2]}-${endArr[0]}`;

if ( {{ select1.value }} === "sevenDays" ){
  const sevenDayMilli = Date.parse(new Date()) - ( 1000 * 60 * 60 * 24 * 7 );
  const sevenDaysAgoDay = new Date(sevenDayMilli).toISOString().slice(0,10).split('-');
  const defaultStart7 = `${sevenDaysAgoDay[1]}-${sevenDaysAgoDay[2]}-${sevenDaysAgoDay[0]}`;
  return {
    start : defaultStart7,
    end : defaultEnd
  }
} else if ( {{ select1.value }} === "thirtyDays" ){
  // const thirtyDayAgoMilli = Date.parse(new Date()) - ( 1000 * 60 * 60 * 24 * 30 );
  // const thirtyDaysAgoDay = new Date(thirtyDayAgoMilli).toISOString().slice(0,10).split('-');
  // const defaultStart30 = `${thirtyDaysAgoDay[1]}-${thirtyDaysAgoDay[2]}-${thirtyDaysAgoDay[0]}`;
    return {
    start : defaultStart30,
    end : defaultEnd
  }
} else if ( {{ select1.value }} === "ninetyDays" ){
  const ninetyDayAgoMilli = Date.parse(new Date()) - ( 1000 * 60 * 60 * 24 * 90 );
  const ninetyDaysAgoDay = new Date(ninetyDayAgoMilli).toISOString().slice(0,10).split('-');
  const defaultStart90 = `${ninetyDaysAgoDay[1]}-${ninetyDaysAgoDay[2]}-${ninetyDaysAgoDay[0]}`;
    return {
    start : defaultStart90,
    end : defaultEnd
  }
} else if ( {{select1.value}} === "oneYear" ){
  const oneYearAgoMilli = Date.parse(new Date()) - ( 1000 * 60 * 60 * 24 * 360 );
  const oneYearAgoDay = new Date(oneYearAgoMilli).toISOString().slice(0,10).split('-');
  const defaultStart360 = `${oneYearAgoDay[1]}-${oneYearAgoDay[2]}-${oneYearAgoDay[0]}`;
    return {
    start : defaultStart360,
    end : defaultEnd
  }
}

if ( {{ select1.value }} === "customRange" ){
if ( wrongStart === "" && wrongEnd === "" ){
  return {
    start : defaultStart30,
    end : defaultEnd 
  }
} else if ( wrongStart === "" && wrongEnd != "" ){
  return {
    start : defaultStart30,
    end : end
  }
} else if ( wrongStart != "" && wrongEnd != "" ){
  return {
    start : start,
    end : end
  }
}
}
