<App>
  <Include src="./functions.rsx" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Alert2 id="alert1" value="Alert">
      <State
        id="0"
        actionIconPositions="right"
        actionPositions="bottom"
        actionTexts="Action"
        actionTooltips={null}
        backgroundColors={null}
        borderColors={null}
        colors={null}
        descriptions="Description"
        iconPositions="center"
        icons="bold/interface-alert-information-circle"
        styleVariants="info"
        titles="Info"
        tooltips={null}
        values="Alert"
      />
      <State
        id="1"
        actionIconPositions="right"
        actionPositions="bottom"
        actionTexts="Action"
        actionTooltips={null}
        backgroundColors={null}
        borderColors={null}
        colors={null}
        descriptions="Description"
        iconPositions="center"
        icons="bold/interface-validation-check-circle"
        styleVariants="success"
        titles="Success"
        tooltips={null}
        values="success"
      />
      <State
        id="2"
        actionIconPositions="right"
        actionPositions="bottom"
        actionTexts="Action"
        actionTooltips={null}
        backgroundColors={null}
        borderColors={null}
        colors={null}
        descriptions="Description"
        iconPositions="center"
        icons="bold/interface-alert-warning-triangle"
        styleVariants="warning"
        titles="Warning"
        tooltips={null}
        values="warning"
      />
      <State
        id="3"
        actionIconPositions="right"
        actionPositions="bottom"
        actionTexts="Action"
        actionTooltips={null}
        backgroundColors={null}
        borderColors={null}
        colors={null}
        descriptions="Description"
        iconPositions="center"
        icons="bold/interface-delete-circle"
        styleVariants="error"
        titles="Error"
        tooltips={null}
        values="error"
      />
    </Alert2>
  </Frame>
</App>
