// Prepare available variables to be used
let available_var = {
  'PDF Date': moment().format('MM/DD/yyyy'),
  'Provider Name': CaseBasicInfo.value?.Reference_Provider_Name,
  'Provider Address': ['Other, Input Manually'],
  'Provider Address Other': '<Add Provider Address Manually Here>',
  'Attention': '<Add Attention Personnel / Department Manually>',
  'Case Received Date': CaseBasicInfo.value?.Case_Received_Date,
  'Case Ref': CaseBasicInfo.value?.case_ref,
  'Case Ref Start Date': CaseBasicInfo.value?.Reference_Start_Date,
  'Case Ref End Date': CaseBasicInfo.value?.Reference_End_Date,
  'Case Bill Amount': CaseBasicInfo.value?.Reference_Bill_Amount,
  'Case Member ID': CaseBasicInfo.value?.case_memberid,
  'Case Member Name': CaseBasicInfo.value?.Reference_Member_Name,
};

// Determine needed vars according to PDF Type
let var_list = [];
switch (PDF_Template) {
  case 'PHP_Appeal_AKL':
    var_list = ['PDF Date', 'Subject', 'Attention', 'Case Received Date', 'Case Ref', 'Case Member ID'];
    available_var.Subject = 'Provider Acknowledgement Letter';
    break;

  case 'PHP_Appeal_WOL_Request':
    var_list = ['PDF Date', 'Subject', 'Attention', 'Provider Name', 'Provider Address', 'Provider Address Other'];
    available_var.Subject =
      CaseBasicInfo.value?.WOL_2nd_Request_Date != null
        ? 'WOL Request 3rd Attempt (Last Attempt)'
        : (CaseBasicInfo.value?.WOL_1st_Request_Date != null
            ? 'WOL Request 2nd Attempt'
            : 'WOL Request 1st Attempt');
    break;
    
  case 'PHP_Appeal_Dismiss':
    var_list = ['PDF Date', 'Attention', 'Provider Name',
                'Case Bill Amount', 'Case Ref', 'Case Ref Start Date', 'Case Ref End Date',
                'Case Member Name', 'Case Member ID', 'Dismiss Reason'];

    if (PDF_Hint == 'RSN_Untimely_Filling') {
      available_var['Dismiss Reason'] =
        `Providers have sixty (60) days from the date of the Plan’s initial organizational determination on a claim to request an appeal. The claim was denied on <Input Decision Date>. The Plan received a complete appeal request including Waiver of Liability for this claim on <Input>, which was beyond the 60-day limit.`
    } else if (PDF_Hint == 'RSN_No_WOL') {
      available_var['Dismiss Reason'] =
        `The provider has not submitted all required documentation for consideration of determination per Medicare guidelines. PHP is a Medicare Advantage health plan. In accordance with the Center for Medicare and Medicaid Services (CMS) regulations regarding out-of-network provider claim appeals requests, the Plan must have a completed and signed Waiver of Liability (WOL) form on file before we can initiate an investigation into your case. PHP sent written notice requesting a completed Waiver of Liability on ${CaseBasicInfo.value.WOL_1st_Request_Date}, ${CaseBasicInfo.value.WOL_2nd_Request_Date}, and ${CaseBasicInfo.value.WOL_3rd_Request_Date} but has not heard a response, therefore the original decision is being upheld.`
    } else if (PDF_Hint == 'RSN_No_AOR') {
      available_var['Dismiss Reason'] =
        `The provider has not submitted all required documentation for consideration of determination per Medicare guidelines. PHP is a Medicare Advantage health plan. In accordance with the Center for Medicare and Medicaid Services (CMS) regulations regarding out-of-network provider claim appeals requests, the Plan must have a completed and signed Appointment of Representative (AOR) form on file before we can initiate an investigation into your case. PHP sent written notice requesting a completed Waiver of Liability on ${CaseBasicInfo.value.AOR_1st_Request_Date}, ${CaseBasicInfo.value.AOR_2nd_Request_Date}, and ${CaseBasicInfo.value.AOR_3rd_Request_Date} but has not heard a response, therefore the original decision is being upheld.`
    }

    break;
}

// Ad-hoc pull provider address if Provider Address is required
if (var_list.includes('Provider Address')) {
  let address_data = await pull_provider_address.trigger();

  if (address_data.address.length > 0) {
    available_var['Provider Address'] = [...address_data.address, ...available_var['Provider Address']];
  }
}

// Prepare PDF input to be final confirmed
const json_schema_header = {
  "title": "Confirm the below info to be generated into PDF",
  "description": "Modify as needed",
  "type": "object",
  "required": var_list.filter(v => v != 'Provider Address Other')
};

let json_schema_properties = {};
var_list
  .filter(v => v != 'Provider Address Other')
  .forEach(
  component => (
    json_schema_properties[component] = {
      type: 'string',
      title: component
    }
  )
);

let ui_schema = {};
var_list.forEach(
  component => {
    if (component.includes('Date')) {
      ui_schema[component] = {
        'ui:widget': 'date'
      };
    } else if (component.includes('Reason')) {
      ui_schema[component] = {
        'ui:widget': 'textarea',
        'ui:options': {'rows': 5}
      };      
    } else {
      ui_schema[component] = {
        //'ui:emptyValue': ''
      };
    }
  }
)

let default_form_data = {};
var_list.forEach(
  component => {
    if (component in available_var) {
      default_form_data[component] = available_var[component];
    }
  }
)

// Post processing for 3-core React component
let json_schema_dependencies = {};
if (var_list.includes('Provider Address')) {
  json_schema_properties['Provider Address']['enum'] = available_var['Provider Address'];
  json_schema_dependencies = {
    'Provider Address': {
      'oneOf': [
        {
          'properties': {
            'Provider Address': {
              'enum': ['Other, Input Manually']
            }, 
            'Provider Address Other': {
              'type': 'string'
            }
          },
          'required': ['Provider Address Other']
        }
      ]
    }
  };

  ui_schema['Provider Address'] = {};
  ui_schema['ui:order'] = var_list;

  default_form_data['Provider Address'] = available_var['Provider Address'][0];
}

return {'PDF_Template': PDF_Template,
        'JSON_Schema': {...json_schema_header,
                        ...{'properties': json_schema_properties},
                        ...{'dependencies': json_schema_dependencies}},
        'UI_Schema': ui_schema,
        'Default_Form_Data': default_form_data
       }