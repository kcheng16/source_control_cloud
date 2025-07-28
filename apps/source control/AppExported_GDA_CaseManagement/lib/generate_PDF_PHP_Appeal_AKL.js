// Construct HTML string here
const html = `
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>Date: ${moment(PDF_input_form.data['PDF Date']).format("MM/DD/yyyy")}</p>
<p>Attention: ${PDF_input_form.data.Attention}</p>
<p>Subject: <u>${PDF_input_form.data.Subject}</u></p>
<p>Dear Provider:&nbsp;</p>
<p>This letter is to acknowledge your request received on ${moment(PDF_input_form.data['Case Received Date']).format('MM/DD/yyyy')}. with regards to: Claim No <strong><u>${PDF_input_form.data['Case Ref']}</u></strong>. Member ID <strong><u>${PDF_input_form.data['Case Member ID']}</u></strong>.</p>
<p style="text-align:center;"><strong><u>Correspondence for additional payment - review of records or a corrected claim&nbsp;</u></strong></p>
<p>We appreciate you bringing your concerns to our attention and look forward to assisting you with a resolution. PHP will conduct an investigation of your case and may contact you if we require additional information. We will provide you with a response to your request within sixty (60) calendar days from the date the request was received.</p>
<p>Please ensure your appeal submission packet includes the following:</p>
<ul>
    <li>Date of service</li>
    <li>Wavier of Liability (WOL)</li>
    <li>Plan Issued Claim number</li>
    <li>Bill Charge Amount</li>
    <li>Expected Payment Amount</li>
    <li>Itemized Bill</li>
</ul>
<p>Your case may be dismissed if we're not able to acquire all above items within sixty (60) calendar days of your original request.</p>
<p>Should you have any questions or concerns regarding this letter, please contact our Claims Department at (888) 662-0626.</p>
<p><br>Sincerely,</p>
<p>Claims Department</p>
`;

// Convert HTML content to pdfmake content
const options = {
  defaultStyles: {
    p: { margin: [0, 0, 0, 5] },
  },
};
const converted = htmlToPdfmake(html, options);

// Finalize pafmake content and add general styling
const docDefinition = {
  content: converted,
  pageSize: "LETTER",
  pageOrientation: "portrait",
  defaultStyle: {
    lineHeight: 1,
  },
  header: {
    margin: [0, 30, 40, 0],
    columns: [
      { text: "" }, // Placeholder for the left side
      {
        image: "data:image/jpeg;base64," + logo_PHP_CA.value,
        width: 120,
        alignment: "right",
      },
    ],
  },
  footer: {
    columns: [
      {
        text: `Claims Department: 6255 Sunset Blvd. 19th Floor, Los Angeles, California 90028
               Contact: (888) 662-0626 Fax: (888) 235-9274`,
        width: "*",
        alignment: "center",
      },
    ],
  },
};

// Generate PDF
pdfMake.createPdf(docDefinition).download(`AKL_${global_case_id.value}.pdf`);
