let doc_record = [];

/* 
General Situation
*/
// Initial request
doc_record.push({
  "Required Doc": "Initial Request",
  Status: pull_CaseAttachment.data.attachment_desc
    .map((x) => x.split("~")[0])
    .includes("Initial Request")
    ? "Found"
    : "Optional",
});

// WOL for Appeal, Dispute
if (CaseBasicInfo.value.WOLAOR_req == 'Require WOL') {
  doc_record.push({
    "Required Doc": "Waiver of Liability",
    Status:
      pull_CaseAttachment.data.attachment_desc.includes(
        "Waiver of Liability"
      ) ||
      pull_CaseAttachment.data.attachment_desc.includes(
        "Initial Request~with WOL/AOR"
      )
        ? "Found"
        : "Not Found",
  });
}

// AOR for Appeal, Dispute
if (CaseBasicInfo.value.WOLAOR_req == 'Require AOR') {
  doc_record.push({
    "Required Doc": "Appointment of Representative",
    Status:
      pull_CaseAttachment.data.attachment_desc.includes(
        "Appointment of Representative"
      ) ||
      pull_CaseAttachment.data.attachment_desc.includes(
        "Initial Request~with WOL/AOR"
      )
        ? "Found"
        : "Not Found",
  });
}

// Resolution Letter for Reopen, Inquiry
if (["Reopen", "Inquiry"].includes(CaseBasicInfo.value.casetype_description)) {
  doc_record.push({
    "Required Doc": "Resolution Letter",
    Status: pull_CaseAttachment.data.attachment_desc.includes(
      "Resolution Letter"
    )
      ? "Found"
      : "Optional",
  });
}

/*
Scenario Specific Situation
*/
switch (CaseBasicInfo.value.lob) {
  case "PHP":
    // CMS Appeal Specific Container
    if (Container_CMSAppeal.currentViewIndex >= 1) {
      doc_record.push({
        "Required Doc": "Acknowledge Letter",
        Status: pull_CaseAttachment.data.attachment_desc.includes(
          "Acknowledge Letter"
        )
          ? "Found"
          : "Not Found",
      });
      doc_record.push({
        "Required Doc": "Resolution Letter",
        Status: pull_CaseAttachment.data.attachment_desc.includes(
          "Resolution Letter"
        )
          ? "Found"
          : "Not Found",
      });
      
    }

    switch (CaseBasicInfo.value.casetype_description) {
      case "Dispute":
        break;

      case "Pre-Service Appeal":
        break;

      case "Post-Service Appeal":
        break;
    }
    break;

  case "PHC":
    break;

  case "AHF":
    break;
}

return doc_record;
