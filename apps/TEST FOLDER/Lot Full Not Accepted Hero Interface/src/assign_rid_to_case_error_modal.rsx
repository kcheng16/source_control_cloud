<Modal
  id="assign_rid_to_case_error_modal"
  buttonText="RID_SFDC_issue
"
  hidden="{{!assign_rid_to_case_error_modal.opened}}"
  modalHeightType="auto"
>
  <Text
    id="text77"
    horizontalAlign="center"
    marginType="normal"
    value="#### Uh Oh! there was a little problem, let's take a couple steps to help "
    verticalAlign="center"
  />
  <Text
    id="text78"
    marginType="normal"
    value="let's check to make sure the reservation is in SalesForce first"
    verticalAlign="center"
  />
  <Include src="./check_for_res_in_SFDC.rsx" />
</Modal>
