<GlobalFunctions>
  <SqlQueryUnified
    id="purchasesWithCoupons"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/purchasesWithCoupons.sql", "string")}
    queryTimeout="100000"
    resourceName="fee4db3c-0d24-4aa7-87e4-d6cf6bdf2948"
    showSuccessToaster={false}
    transformer={
      'const getDataByType = (type, key) => {\n  const index = data.time_period.findIndex(item => item === type);\n  return data[key][index];\n};\n\nconst currentPurchasesWithCoupons = getDataByType("current", "cnt_transactions_with_coupons");\nconsole.log(\'currentPurchasesWithCoupons\', currentPurchasesWithCoupons)\nconst pastPurchasesWithCoupons = getDataByType("past", "cnt_transactions_with_coupons");\nconst currentTransactions = getDataByType("current", "cnt_transactions");\nconst pastTransactions = getDataByType("past", "cnt_transactions");\n\nconst current = (currentPurchasesWithCoupons && currentPurchasesWithCoupons != 0) ? ((currentPurchasesWithCoupons/currentTransactions)*100).toFixed(2) : \'0.00\';\nconst past = (pastPurchasesWithCoupons && pastPurchasesWithCoupons != 0) ? (pastPurchasesWithCoupons/pastTransactions*100).toFixed(2) : \'0.00\';\nconst diff = (current - past).toFixed(2);\n\n\nconst getTrendVariant = () => {\n    if(diff < 0 ) return \'negative\'\n    if(diff > 0 ) return \'positive\'\n    return \'neutral\';\n}\n\nreturn {\n  values: {\n    current: current,\n    past: past,\n  },\n  diff,\n  trendVariant: getTrendVariant()\n};\n\n'
    }
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="totalSalesViaCoupon"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/totalSalesViaCoupon.sql", "string")}
    queryTimeout="100000"
    resourceName="fee4db3c-0d24-4aa7-87e4-d6cf6bdf2948"
    showSuccessToaster={false}
    transformer="function formatCurrency(num){
  return new Intl.NumberFormat('en-US', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
    }
  ).format(num)
}

const currentTotalAmount = data.total_sales_current[0]/100;
const pastTotalAmount = data.total_sales_past[0]/100;
const currentTotalAmountCoupon = data.total_sales_with_coupon_current[0]/100;
const pastTotalAmountCoupon = data.total_sales_with_coupon_past[0]/100;

const diffTotalAmount = currentTotalAmount - pastTotalAmount
const diffTotalAmountCoupons = currentTotalAmountCoupon - pastTotalAmountCoupon

const getTrendVariant = (diff) => {
    if(diff < 0 ) return 'negative'
    if(diff > 0 ) return 'positive'
    return 'neutral';
}

return {
  total_sales: {
      values: {
    current: formatCurrency(currentTotalAmount),
    old: formatCurrency(pastTotalAmount),
  },
  diff: formatCurrency(diffTotalAmount),
  trendVariant: getTrendVariant(diffTotalAmount)
  },
  total_sales_with_coupon: {
      values: {
    current: formatCurrency(currentTotalAmountCoupon),
    old: formatCurrency(pastTotalAmountCoupon),
  },
  diff: formatCurrency(diffTotalAmountCoupons),
  trendVariant: getTrendVariant(diffTotalAmountCoupons)
  }
};

"
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="couponAOV"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/couponAOV.sql", "string")}
    queryTimeout="20000"
    resourceName="fee4db3c-0d24-4aa7-87e4-d6cf6bdf2948"
    showSuccessToaster={false}
    transformer="function formatCurrency(num){
  return new Intl.NumberFormat('en-US', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
    }
  ).format(num)
}

const currentTotalCount = data.current_total_count;
const pastTotalCount = data.past_total_count;
const currentGMV = data.current_gmv[0]/100;
const pastGMV = data.past_gmv[0]/100;

const currentAOV = currentTotalCount == 0 ? 0 :(currentGMV/currentTotalCount).toFixed(2);
const pastAOV = pastTotalCount == 0 ? 0 : (pastGMV/pastTotalCount).toFixed(2);
const diff = currentAOV-pastAOV;

const getTrendVariant = () => {
    if(diff < 0 ) return 'negative'
    if(diff > 0 ) return 'positive'
    return 'neutral';
}

return {
  values: {
    current: formatCurrency(currentAOV),
    old: formatCurrency(pastAOV),
  },
  diff: formatCurrency(diff),
  trendVariant: getTrendVariant()
};

"
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="totalAmountDiscounted"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    importedQueryInputs={{
      ordered: [
        { variable0: "{{ date.value.current.start }}" },
        { variable1: "{{ date.value.current.end }}" },
        { variable2: "{{ date.value.past.start }}" },
        { variable3: "{{ date.value.past.end }}" },
        { variable4: "{{ current_user.metadata.SchoolID }}" },
      ],
    }}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    playgroundQueryUuid={null}
    query={include("./lib/totalAmountDiscounted.sql", "string")}
    resourceName="fee4db3c-0d24-4aa7-87e4-d6cf6bdf2948"
    showSuccessToaster={false}
    transformer="function formatCurrency(num){
  return new Intl.NumberFormat('en-US', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
    }
  ).format(num)
}

const currentTotalAmountDiscounted = data.current[0]/100;
const pastTotalAmountDiscounted = data.past[0]/100;
const diff = currentTotalAmountDiscounted - pastTotalAmountDiscounted

const getTrendVariant = () => {
    if(diff < 0 ) return 'negative'
    if(diff > 0 ) return 'positive'
    return 'neutral';
}

return {
  values: {
    current: formatCurrency(currentTotalAmountDiscounted),
    old: formatCurrency(pastTotalAmountDiscounted),
  },
  diff: formatCurrency(diff),
  trendVariant: getTrendVariant()
};

"
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="couponsChart"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/couponsChart.sql", "string")}
    resourceName="fee4db3c-0d24-4aa7-87e4-d6cf6bdf2948"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="couponsChartOverTime"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/couponsChartOverTime.sql", "string")}
    resourceName="fee4db3c-0d24-4aa7-87e4-d6cf6bdf2948"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="totalTransactions"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    importedQueryInputs={{
      ordered: [
        { variable0: "{{ current_user.metadata.SchoolID }}" },
        { variable1: "{{ couponDateFiltersold.startDate }}" },
        { variable2: "{{ couponDateFiltersold.endDate }}" },
      ],
    }}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    playgroundQueryUuid={null}
    query={include("./lib/totalTransactions.sql", "string")}
    resourceName="fee4db3c-0d24-4aa7-87e4-d6cf6bdf2948"
    showSuccessToaster={false}
    transformer="const getDataByType = (type) => {
  const index = data.type.findIndex(item => item === type);
  return data.count[index];
};

const currentTransactions = getDataByType('current');
const pastTransactions = getDataByType('past');

return {
  values: {
    current: currentTransactions,
    past: pastTransactions,
  }
};

"
    warningCodes={[]}
  />
  <Function id="date" funcBody={include("./lib/date.js", "string")} />
  <SqlQueryUnified
    id="getCoupons"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    query={include("./lib/getCoupons.sql", "string")}
    resourceName="fee4db3c-0d24-4aa7-87e4-d6cf6bdf2948"
    resourceTypeOverride=""
    transformer="// Query results are available as the `data` variable
return data"
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="getProductContext"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    query={include("./lib/getProductContext.sql", "string")}
    resourceName="fee4db3c-0d24-4aa7-87e4-d6cf6bdf2948"
    resourceTypeOverride=""
    transformer="const tranformToDecimal = (amount) => {
   if(amount === null || isNaN(amount)) {
    return 'N/A';
  }
  const num = parseFloat(amount).toLocaleString('en-US', {maximumFractionDigits: 2}) 
  return '$' + num
}

const res = {};
data.product_id.forEach((item, index) => {
  res[item] = `${data.product_name[index]} - ${data.pricing_plan_name[index]}`
})

return res"
    warningCodes={[]}
  />
</GlobalFunctions>
