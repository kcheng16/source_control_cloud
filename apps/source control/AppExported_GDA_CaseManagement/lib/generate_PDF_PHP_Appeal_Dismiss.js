// Construct HTML string here
const html = `
<h4>Notice of Dismissal of Appeal Request</h4>

    <table data-pdfmake='{"layout":"noBorders", "widths": ["40%", "auto"]}'>
        <tbody>
            <tr>
                <td><span style="font-size:14px;">Date: ${moment(PDF_input_form.data['PDF Date']).format("MM/DD/yyyy")}</span></td>
                <td><span style="font-size:14px;">Attention: ${PDF_input_form.data.Attention}</span></td>
            </tr>
            <tr>
                <td><span style="font-size:14px;">Provider: ${PDF_input_form.data['Provider Name']}</span></td>
                <td><span style="font-size:14px;">Claim Number: ${PDF_input_form.data['Case Ref']}</span></td>
            </tr>
            <tr>
                <td><span style="font-size:14px;">Enrollee’s Name: ${PDF_input_form.data['Case Member Name']}</span></td>
                <td><span style="font-size:14px;">Enrollee ID Number: ${PDF_input_form.data['Case Member ID']}</span></td>
            </tr>
            <tr>
                <td><span style="font-size:14px;">Date of Service: ${PDF_input_form.data['Case Ref Start Date']} - ${PDF_input_form.data['Case Ref End Date']}</span></td>
                <td><span style="font-size:14px;">Billed Charges: ${PDF_input_form.data['Case Bill Amount']}</span></td>
            </tr>
        </tbody>
    </table>

<p><span style="font-size:14px;">Dear Provider:</span><br><br><span style="font-size:14px;">We <strong>dismissed</strong> the appeal request you filed on 4/17/2024.</span><br><br><span style="font-size:14px;">We can’t process your appeal because:</span></p>
<p style="margin-left:40px;"><span style="font-size:14px;">${PDF_input_form.data['Dismiss Reason']}</span></p>
<p><span style="font-size:14px;">Should you have any questions or concerns regarding this letter, please contact our PHP Claims Department at 1(888) 662-0626, FAX: 1(888)235-9274, M-F 8:30 am PST to 5:00 pm PST.</span></p>
<p><span style="font-size:14px;">If you disagree with our decision to dismiss your appeal request, you have the right to ask an independent reviewer contracted with Medicare to review our decision. You must mail or fax your written request within 60 calendar days of receipt of this Notice of Dismissal of Appeal Request to:</span></p>

    <table style="margin-left:40px;" data-pdfmake='{"layout":"noBorders", "widths": ["60%", "30%"]}'>
        <tbody>
            <tr>
                <td><span style="font-size:14px;"><strong>MAXIMUS Federal Services, Inc.&nbsp;</strong></span></td>
                <td><span style="font-size:14px;">Phone: (585) 348-3300</span></td>
            </tr>
            <tr>
                <td><span style="font-size:14px;"><strong>Medicare Managed Care &amp; PACE Reconsideration Project</strong></span></td>
                <td><span style="font-size:14px;">Fax: (585) 425-5292</span></td>
            </tr>
            <tr>
                <td><span style="font-size:14px;">3750 Monroe Avenue Suite 702</span></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><span style="font-size:14px;">Pittsford, NY 14534-1302</span></td>
                <td>&nbsp;</td>
            </tr>
        </tbody>
    </table>

<p><span style="font-size:14px;">Include a copy of this Notice of Dismissal of Appeal Request along with any supporting information with your request for review. The independent reviewer will send you a notice of its decision. If the independent reviewer agrees that your appeal should not have been dismissed, your appeal request will be returned to PHP for processing.</span></p>
<p><span style="font-size:14px;">Sincerely,</span><br><span style="font-size:14px;">Phyllis H</span><br><span style="font-size:14px;">Claims Representative</span></p>
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
pdfMake.createPdf(docDefinition, {tableLayouts: 'noBorders'}).download(`Dismiss_${global_case_id.value}.pdf`);
