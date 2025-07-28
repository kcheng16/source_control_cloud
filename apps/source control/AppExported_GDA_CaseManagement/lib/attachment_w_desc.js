let raw_parsed_file = {{ FileDropZone.value }};
let attachment_desc = {{ FileUploaded_table.changesetArray }};

let parsed_file_w_desc = 
  raw_parsed_file.map(item1 => {
    const matchingItem = attachment_desc.find(item2 => item2.FileName === item1.name);
    return {
      ...item1,
      desc: matchingItem ? matchingItem.desc : null
    };
});

return parsed_file_w_desc