const attachment_data = download_attachmentContent.data?.attachment_data;
const attachment_name = download_attachmentContent.data?.attachment_name;
//const attachment_type = download_attachmentContent.data?.attachment_type;

utils.downloadFile({base64Binary: attachment_data,
                    fileName: attachment_name})