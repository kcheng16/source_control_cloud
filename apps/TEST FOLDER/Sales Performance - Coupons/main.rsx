<App>
  <Include src="./functions.rsx" />
  <AppStyles id="$appStyles" css={include("./lib/$appStyles.css", "string")} />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="0"
    sticky={null}
    type="main"
  >
    <ModuleContainerWidget
      id="moduleContainer"
      backgroundColor="white"
      isGlobalWidgetContainer={true}
    >
      <Module
        id="commerceHeading4"
        margin="0"
        name="CommerceHeading"
        pageUuid="35c0fbb1-d5c6-43ff-b868-32732de67064"
        text="Coupons again"
        type="h2"
      />
      <Spacer id="spacer12" marginType="normal" />
      <Module
        id="dateFilters"
        margin="0"
        name="CommerceDateFiltersWithInterval"
        pageUuid="911b788d-455b-4068-bb77-9a2753392585"
      />
      <Module
        id="productFilter"
        margin="0"
        name="CommerceProductFilter"
        pageUuid="0cd10348-e81f-4075-b49f-d265f197dbb3"
      />
      <Multiselect
        id="couponFilter"
        captionByIndex="{{getProductContext.data[item.product_id] ? getProductContext.data[item.product_id]: ''}}"
        data="{{ getCoupons.data }}"
        disabledByIndex={
          '{{ \n  //  If selected item === All Coupons then disable all others\n  (item.id !== 0 && couponFilter.selectedItems[0].id === 0 ) \n  ||\n  //  If selected item is not All Coupons then disable "All Coupons"\n      (item.id === 0 && couponFilter.selectedItems.length >= 1)\n    \n    }}'
        }
        emptyMessage="No options"
        label="Coupons"
        labelPosition="top"
        labels="{{ item.name }}"
        marginType="normal"
        overlayMaxHeight={375}
        placeholder="Select options"
        showSelectionIndicator={true}
        value="[0]"
        values="{{ item.id }}"
        wrapTags={true}
      />
      <Spacer id="spacer16" marginType="normal" />
      <Container
        id="container8"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        marginType="normal"
        padding="12px"
        showBody={true}
      >
        <View id="b03e4" viewKey="View 1">
          <Text
            id="text1"
            marginType="normal"
            value="**Total multi-use coupon redemptions (top 8)**"
            verticalAlign="center"
          />
          <PlotlyChart
            id="chart7"
            data={include("./lib/chart7.data.json", "string")}
            dataseries={{
              ordered: [
                {
                  0: {
                    ordered: [
                      { label: "usage_counte" },
                      { datasource: "{{couponsChart.data['usage_counte']}}" },
                      { chartType: "bar" },
                      { aggregationType: "sum" },
                      { color: "#1E3A8A" },
                      { colors: { ordered: [] } },
                      { visible: true },
                      {
                        hovertemplate:
                          "<b>%{x}</b><br>%{fullData.name}: %{y}<extra></extra>",
                      },
                    ],
                  },
                },
              ],
            }}
            datasourceDataType="object"
            datasourceInputMode="javascript"
            datasourceJS="{{couponsChart.data}}"
            isJsonTemplateDirty={true}
            skipDatasourceUpdate={true}
            xAxis="{{couponsChart.data.code}}"
            xAxisDropdown="code"
          />
        </View>
      </Container>
      <Spacer id="spacer14" marginType="normal" />
      <Module
        id="commercePortalsMetricCard7"
        isTrendNegative="{{ 
  purchasesWithCoupons.data.diff< 0
}}"
        label="Purchases with a coupon"
        margin="0"
        metric="{{
purchasesWithCoupons.data.values.current
}}%
"
        name="CommercePortalsMetricCard"
        pageUuid="04b9b86a-dfdc-462d-a718-eace963369e4"
        tooltip="Purchases with a coupon is the proportion of purchases in a given period of time that used a coupon."
        trendValue="{{
  purchasesWithCoupons.data.diff
}}%
"
        trendVariant="{{
purchasesWithCoupons.data.trendVariant
}}"
      />
      <Module
        id="commercePortalsMetricCard8"
        isTrendNegative="{{ totalSalesViaCoupon.data.total_sales_with_coupon.diff< 0}}"
        label="Total sales via coupon"
        margin="0"
        metric="${{
totalSalesViaCoupon.data.total_sales_with_coupon.values.current
}}"
        name="CommercePortalsMetricCard"
        pageUuid="04b9b86a-dfdc-462d-a718-eace963369e4"
        tooltip="Total sales via coupon is the overall revenue coming in from transactions that used a coupon. "
        trendValue="${{
totalSalesViaCoupon.data.total_sales_with_coupon.diff
}}
"
        trendVariant="{{totalSalesViaCoupon.data.total_sales_with_coupon.trendVariant}}
"
      />
      <Module
        id="commercePortalsMetricCard9"
        isTrendNegative="{{ couponAOV.data.diff< 0}}"
        label="Coupon AOV"
        margin="0"
        metric="${{ 
  couponAOV.data.values.current
}}"
        name="CommercePortalsMetricCard"
        pageUuid="04b9b86a-dfdc-462d-a718-eace963369e4"
        tooltip="Coupon AOV (average order value) is the average value of a transaction that used a coupon. "
        trendValue="${{ 
  couponAOV.data.diff
}}"
        trendVariant="{{ 
  couponAOV.data.trendVariant
}}"
      />
      <Spacer id="spacer15" marginType="normal" />
      <Module
        id="commercePortalsMetricCard10"
        isTrendNegative="{{ 
  totalAmountDiscounted.data.diff< 0
}}"
        label="Total amount discounted"
        margin="0"
        metric="${{
totalAmountDiscounted.data.values.current
}}"
        name="CommercePortalsMetricCard"
        pageUuid="04b9b86a-dfdc-462d-a718-eace963369e4"
        tooltip="Total amount discounted is the cumulative dollar amount taken off of the standard purchase price using a coupon. "
        trendValue="${{ 
  totalAmountDiscounted.data.diff
}}"
        trendVariant="{{ totalAmountDiscounted.data.trendVariant
}}"
      />
      <Spacer id="spacer18" marginType="normal" />
      <Container
        id="container7"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        marginType="normal"
        padding="12px"
        showBody={true}
      >
        <Header>
          <Text
            id="containerTitle2"
            marginType="normal"
            value="#### Container title"
            verticalAlign="center"
          />
        </Header>
        <View id="b03e4" viewKey="View 1">
          <Module
            id="intervalSelect"
            endDate="{{date.value.current.end}}"
            margin="0"
            name="CommerceIntervalSelect"
            pageUuid="1882858a-d006-4b96-9a7a-8433501bc7be"
            startDate="{{date.value.current.start}}"
          />
          <Text
            id="text2"
            marginType="normal"
            value="**Multi-use coupon redemptions over time (top 8)**"
            verticalAlign="center"
          />
          <PlotlyChart
            id="chart6"
            chartType="line"
            data={include("./lib/chart6.data.json", "string")}
            dataseries={{
              ordered: [
                {
                  0: {
                    ordered: [
                      { label: "usage_counte" },
                      {
                        datasource:
                          "{{couponsChartOverTime.data['usage_counte']}}",
                      },
                      { chartType: "line" },
                      { aggregationType: "sum" },
                      { color: null },
                      {
                        colors: {
                          ordered: [
                            { 0: "#1E3A8A" },
                            { 1: "#3170F9" },
                            { 2: "#60A5FA" },
                            { 3: "#DBEAFE" },
                          ],
                        },
                      },
                      { visible: true },
                      {
                        hovertemplate:
                          "<b>%{x}</b><br>%{fullData.name}: %{y}<extra></extra>",
                      },
                    ],
                  },
                },
              ],
            }}
            datasourceDataType="object"
            datasourceInputMode="javascript"
            datasourceJS="{{couponsChartOverTime.data}}"
            groupByDropdown="code"
            groupByJS="{{couponsChartOverTime.data['code']}}"
            isDataTemplateDirty={true}
            isJsonTemplateDirty={true}
            skipDatasourceUpdate={true}
            xAxis="{{couponsChartOverTime.data.date}}"
            xAxisDropdown="date"
          />
        </View>
      </Container>
    </ModuleContainerWidget>
  </Frame>
</App>
