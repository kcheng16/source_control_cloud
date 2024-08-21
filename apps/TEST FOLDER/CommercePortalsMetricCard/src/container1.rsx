<Container
  id="container1"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="normal"
  padding="12px"
  showBody={true}
>
  <Header>
    <Text
      id="containerTitle1"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="6595b" viewKey="View 1">
    <Text
      id="text1"
      marginType="normal"
      tooltipText="{{tooltip.value}}"
      value={
        "<div> \n  <span style=\"font-size: 14px; font-style: normal; font-weight: 400; line-height: 125%; letter-spacing: 0.5px; {{tooltip.value ? 'border-bottom: 1px dashed #646464' : null}}\">\n    {{label.value}}\n  </span>\n</div>"
      }
      verticalAlign="center"
    />
    <Spacer id="spacer1" />
    <Text
      id="text2"
      marginType="normal"
      value={
        '<div style="font-size: 32px;font-style: normal;font-weight: 600;line-height: 125%;">\n  {{metric.value}}\n</div>'
      }
      verticalAlign="center"
    />
    <CustomComponent
      id="customComponent1"
      allowFullscreen={true}
      iframeCode={
        '\n<style>\n  @import url(\'https://fonts.cdnfonts.com/css/sf-pro-display\');\n  \n  :root {\n  --Neutral-Grey-100: #222;\n  --Line-Primary: #e4e4e4;\n  --Hues-Grey-2: #fbfbfb;\n  --Hues-Green-10: #ebf8ef;\n  --Hues-Red-10: #fbebeb;\n  --Hues-Grey-9: #ebebeb \n  }\n  body{\n    margin: 0;\n    display: flex;\n    flex-direction: row-reverse\n  }\n\n\n  #react {\n    height: 100%;\n    width: fit-content;\n  }\n\n.pill {\n  margin: 0;\n  display: flex;\n  padding: 8px;\n  align-items: center;\n  justify-content: center;\n\n  border-radius: 20px;\n  \n  color: var(--Neutral-Grey-100, #222);\n\n  /* Text */\n  text-align: center;\n  /* Body text small bold */\n  font-family: \'SF Pro Display\';\n  font-size: 14px;\n  font-style: normal;\n  font-weight: 600;\n  line-height: 125%; /* 17.5px */\n  letter-spacing: 0.5px;\n}\n\n.negative {\n  background: var(--Hues-Red-10);\n  fill: #D93838;\n}\n\n.positive {\n  background: var(--Hues-Green-10);\n  fill: #38BA5F\n}\n\n.neutral{\n  background: var(--Hues-Grey-9);\n  fill: #4E4E4E;\n}\n\n</style>\n\n<!-- You can add any HTML/CSS/JS here. UMD versions are required.\nKeep in mind that Custom Components are sensitive to bundle sizes, so try using a\ncustom implementation when possible. -->\n<script crossorigin src="https://unpkg.com/react@18/umd/react.development.js"></script>\n<script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>\n\n<div id="react"></div>\n\n<script type="text/babel">\n  const MyCustomComponent = ({ triggerQuery, model, modelUpdate }) => {\n    const {isNegative, value, variant} = model;\n    return (\n      <div className={`pill ${variant}`}>\n         <svg\n          xmlns="http://www.w3.org/2000/svg"\n          width="24"\n          height="24"\n          viewBox="0 0 24 24"\n          fill="none"\n          style={isNegative ? { rotate: \'180deg\' } : {}}\n          >\n            <path d="M7 14L12 9L17 14H7Z" className={variant}/>\n          </svg>\n        {value}\n      </div>\n    )\n  }\n\n  // This is the entrypoint for the React component.\n  const ConnectedComponent = Retool.connectReactComponent(MyCustomComponent)\n  const container = document.getElementById(\'react\')\n  const root = ReactDOM.createRoot(container)\n  root.render(<ConnectedComponent />)\n</script>\n'
      }
      model="{
  isNegative: {{isTrendNegative.value ?? isTrendNegative.defaultValue}},
  value: {{trendValue.value ?? trendValue.defaultValue}},
  variant : {{trendVariant.value ?? trendVariant.defaultValue}},
}"
      renderInQuirksMode={false}
    />
  </View>
</Container>
