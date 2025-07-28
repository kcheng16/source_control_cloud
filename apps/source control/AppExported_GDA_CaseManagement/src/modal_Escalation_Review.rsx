<ModalFrame
  id="modal_Escalation_Review"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showHeader={true}
  showOverlay={true}
  size="large"
>
  <Header>
    <Text
      id="modalTitle12"
      value="### Escalation Review"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton12"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="modal_Escalation_Review"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Form
      id="form1"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showFooter={true}
    >
      <Header>
        <Text id="formTitle9" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <Multiselect
          id="escalation_assignee_input"
          emptyMessage="No options"
          itemMode="static"
          label="Escalation Assignee"
          labelPosition="top"
          overlayMaxHeight={375}
          placeholder="Select options"
          required={true}
          showSelectionIndicator={true}
          wrapTags={true}
        >
          <Option
            id="193ab"
            label="Jason Zhao"
            value="retoolContext.users['jason.zhao@ahf.org']"
          />
          <Option
            id="f88ef"
            label="Kamol Singh"
            value="retoolContext.users['kamol.singh@ahf.org']"
          />
          <Option
            id="46b2a"
            label="Claim Dept Supervisor"
            value="retoolContext.groups['Claim Dept Supervisor']"
          />
        </Multiselect>
        <Switch
          id="escalation_requiredecision_input"
          label="Require Decision?"
          labelPosition="left"
        />
        <TextArea
          id="escalation_task_input"
          autoResize={true}
          label="Escalation Task"
          labelPosition="top"
          minLines="4"
          placeholder="Enter value"
          required={true}
        />
      </Body>
      <Footer>
        <Button
          id="formButton9"
          submit={true}
          submitTargetId="form1"
          text="Initate Escalation"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="initiate_Escalation"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </Body>
</ModalFrame>
