<ModalFrame
  id="modal_Establish_Case"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showOverlay={true}
>
  <Header>
    <Text id="modalTitle8" value="### Container title" verticalAlign="center" />
    <Button
      id="modalCloseButton8"
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
        pluginId="modal_Establish_Case"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Text
      id="text17"
      value={
        '<p><span style="font-size:15px;"><strong>By Clicking the botton below, you acknowledge that</strong></span></p>\n<ul>\n    <li><span style="font-size:13px;">This action is NOT reversible</span></li>\n    <li><span style="font-size:13px;">You MUST follow official CMS guideline in processing the <u>{{ CaseBasicInfo.value.casetype_description }}</u></span></li>\n</ul>'
      }
      verticalAlign="center"
    />
    <Button
      id="button24"
      style={{ ordered: [{ background: "rgba(253, 157, 62, 0.7)" }] }}
      text="Yes, I acknowledge and want to proceed"
    >
      <Event
        event="click"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  {
                    additionalScope: {
                      ordered: [
                        { casedetailtype_description: "_EstablishCase" },
                        { casedetail_info: "" },
                        { addson1: "" },
                        { addson2: "" },
                        { addson3: "" },
                      ],
                    },
                  },
                ],
              },
            },
          ],
        }}
        pluginId="add_CaseDetail_General"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="modal_Establish_Case"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Body>
</ModalFrame>
