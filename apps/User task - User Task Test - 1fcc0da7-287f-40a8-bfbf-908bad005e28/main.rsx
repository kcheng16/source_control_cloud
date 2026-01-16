<App>
  <Include src="./functions.rsx" />
  <UrlFragments id="$urlFragments" value={{ ordered: [] }} />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Container
      id="container1"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <IconText
          id="iconText1"
          icon="bold/interface-alert-information-circle"
          style={{ ordered: [{ fontSize: "h4Font" }, { fontWeight: "700" }] }}
          text="Building a User Task App"
          textSize="h4"
        />
      </Header>
      <View id="878f3" viewKey="View 1">
        <Text
          id="text2"
          value={
            "👋 **Hello {{ current_user.firstName || 'friend' }}!** \n\nThis app contains three  autopopulated queries that establish a connection between this app and your Workflow containing your user task or tasks. Below, you will also find a template consisting of a form and a table to work from. Customize this app based on your use case, utilizing the following three queries:\n\n**getUserTasks** retrieves all of the task instances assigned to the user(s) from the specific task block that you created. In order to see task instances populate in the table, run your workflow.\n\n**submitUserTask** submits a task output back to the workflow. A task output is the data that you are expecting from your user in order for a task to be marked submitted and for the workflow to continue to run. In this template's example, the task output would be the boolean field \"Approved.\" When this query executes, the task will be marked as submitted, and the workflow will continue to run.\n\n**getSingleUserTask** retrieves a single task. By default, this query references the task Id in the app's url parameters if present. To surface a particular task to a user, send them the url to this app using the taskURL property available on the user task block via the task block's notification port. The taskURL property is this app's url, with the particular task Id included as a url parameter.\n\nRead more in docs [here](https://docs.retool.com/workflows/guides/user-tasks)!"
          }
          verticalAlign="center"
        />
      </View>
    </Container>
    <Table
      id="table1"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ getUserTasks.data.data }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: "" }}
      emptyMessage="No tasks exist yet. Run the workflow to create one."
      enableSaveActions={true}
      rowHeight="small"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="c3bc1"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="id"
        label="ID"
        placeholder="Enter value"
        position="center"
        size={133}
        summaryAggregationMode="none"
      />
      <Column
        id="7cfe8"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="taskName"
        label="Task name"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="af236"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="workflowName"
        label="Workflow name"
        placeholder="Select option"
        position="center"
        size={111}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="37c1a"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="status"
        label="Status"
        optionList={{
          manualData: [
            {
              ordered: [
                { value: "Submitted" },
                { color: "rgb(167, 243, 208)" },
              ],
            },
            {
              ordered: [
                { value: "Expired\n" },
                { color: "rgb(253, 230, 138)" },
              ],
            },
            {
              ordered: [
                { value: "Cancelled\n" },
                { color: "rgb(254, 202, 202)" },
              ],
            },
            {
              ordered: [{ value: "Pending" }, { color: "rgb(238, 207, 243)" }],
            },
          ],
        }}
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="68d9c"
        alignment="left"
        format="json"
        groupAggregationMode="none"
        key="context"
        label="Task context"
        placeholder="Enter value"
        position="center"
        size={196}
        summaryAggregationMode="none"
      />
      <Column
        id="fae99"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        key="createdAt"
        label="Created at"
        placeholder="Enter value"
        position="center"
        size={172}
        summaryAggregationMode="none"
      />
      <Column
        id="4e538"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="workflowRelease"
        label="Workflow release"
        placeholder="Enter value"
        position="center"
        size={140}
        summaryAggregationMode="none"
      />
      <Column
        id="5f1e6"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="userTaskLink"
        label="Task URL"
        placeholder="Enter value"
        position="center"
        size={149}
        summaryAggregationMode="none"
      />
      <Column
        id="df9dd"
        alignment="left"
        format="json"
        groupAggregationMode="none"
        key="output"
        label="Task output"
        placeholder="Enter value"
        position="center"
        size={231}
        summaryAggregationMode="none"
      />
      <Column
        id="a2645"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        key="completedAt"
        label="Completed at"
        placeholder="Enter value"
        position="center"
        size={169}
        summaryAggregationMode="none"
      />
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <ToolbarButton
        id="3c"
        icon="bold/interface-download-button-2"
        label="Download"
        type="custom"
      >
        <Event
          id="2e463bb8"
          event="clickToolbar"
          method="exportData"
          pluginId="table1"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          id="b7c9878f"
          event="clickToolbar"
          method="refresh"
          pluginId="table1"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
    <Form
      id="form1"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle1"
          value="#### Submit User Task"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Text id="text1" value="**Task Output:**" verticalAlign="center" />
        <Checkbox id="checkbox1" label="Approved" labelWidth="100" />
      </Body>
      <Footer>
        <Button
          id="formButton1"
          submit={true}
          submitTargetId="form1"
          text="Submit"
        />
      </Footer>
      <Event
        id="8110efb1"
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="submitUserTask"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </Frame>
</App>
