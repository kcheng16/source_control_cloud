// Construct HTML string here
const html = `
<p>&nbsp;</p>
<h4>Waiver of Liability Request<br>for Out-of-Network Providers</h4>
<p>&nbsp;</p>
<p>Date: ${moment(PDF_input_form.data['PDF Date']).format("MM/DD/yyyy")}
<br>Notice Attempt: <u>${PDF_input_form.data.Subject}</u>

<br><br>Provider: ${PDF_input_form.data['Provider Name']}
<br>Provider Address: ${PDF_input_form.data['Provider Address'] == 'Other, Input Manually' 
                        ? PDF_input_form.data['Provider Address Other'] 
                        : PDF_input_form.data['Provider Address']}
                        
<br><br>Attn: ${PDF_input_form.data.Attention}</p>
<p><br>Dear Provider:<br><br>PHP is a Medicare Advantage health plan. In accordance with the Centers for Medicare&nbsp;and Medicaid Services (CMS) regulations regarding out-of-network provider claim&nbsp;<br>appeal requests, you must complete the attached form for us to initiate review of your&nbsp;request for reconsideration. Please complete, sign and return the attached Waiver of&nbsp;Liability (WOL) form to:</p>
<p style="margin-left:40px;">Attn: Claims Operations<br>PHP<br>P.O. Box 472377<br>Aurora, CO 80047<br>Fax: 888-235-9274</p>
<p>Failure to submit attached WOL will result in a dismissal of your appeal case on the 60th day from original receipt of appeal request. Should you have any questions regarding&nbsp;this request, please contact our Claims Department at (888) 662-0626, Fax (888) 235-9274.</p>
<p><br>Sincerely,<br>Phyllis H.<br>Claims Operations</p>
<p>&nbsp;</p>
<p class="page-break"> </p>
<h3 style="text-align:center;">Waiver of Liability Statement for Out-of-Network Providers<br>&nbsp;</h3>
<p>Health Plan: __________________________________<br><br>Enrollee: _____________________________________ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Enrollee ID: _____________________________<br><br>Provider: _____________________________________ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Date of Service: _________________________<br><br>Services Rendered:<br><br> _________________________________________________________________________________________________</p>
<p><br><br><br>I hereby waive any right to collect payment from the above-mentioned enrollee for the aforementioned services for which payment has been denied by the above-referenced health plan. I understand that the signing of this waiver does not negate my right to request further appeal under 42 CFR 422.600<br>&nbsp;</p>
<p><br><br><br>  <ovl>     Print Provider/Provider Representative Name     </ovl>
<p><br><br><br>  <ovl>     Provider/Provider Representative Signature        </ovl>                               <ovl>                      Date                      </ovl></p>
<p><br>Send completed form to:</p>
<p style="margin-left:40px;">Attn: Claims Operations<br>PHP<br>P.O. Box 472377<br>Aurora, CO 80047<br>Fax: (888) 235-927&nbsp;</p>
`;

// Convert HTML content to pdfmake content
const options = {
  defaultStyles: {
    p: {margin: [0, 0, 0, 5]},
    ovl: {decoration: 'overline',
          decorationStyle: 'dotted'},
  },
};
let converted = htmlToPdfmake(html, options);

// Finalize pafmake content and add general styling
const docDefinition = {
  content: converted,
  pageSize: "LETTER",
  pageOrientation: "portrait",
  defaultStyle: {
    lineHeight: 1.1,
  },
  pageBreakBefore: function (node) {
    return node.style && node.style.includes("page-break");
  },
  header: function (currentPage) {
    if (currentPage == 1) {
      return {
        margin: [0, 30, 40, 0],
        columns: [
          { text: "" }, // Placeholder for the left side
          {
            image: "data:image/jpeg;base64," + logo_PHP_CA.value,
            width: 120,
            alignment: "right",
          },
        ],
      };
    }
  },
  footer: function (currentPage) {
    if (currentPage == 1) {
      return {
        columns: [
          {
            text: `Claims Department: 6255 Sunset Blvd. 19th Floor, Los Angeles, California 90028
               Contact: (888) 662-0626 Fax: (888) 235-9274`,
            width: "*",
            alignment: "center",
          },
        ],
      };
    }
  },
};

// Generate PDF
pdfMake
  .createPdf(docDefinition)
  .download(`WOL_Request_${global_case_id.value}.pdf`);
