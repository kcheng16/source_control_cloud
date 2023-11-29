// Returns the list of visible apps for this user, by category.
const result = {};

// Determine "active app"
// Dosen't necessarily match current app UUID exactly because of child apps
let activeUuid = {{retoolContext.appUuid}};
const parentUuid = {{Common.APPS}}[activeUuid]?.parent;
if (parentUuid) {
  activeUuid = parentUuid;
}

for (const [uuid, data] of Object.entries({{Common.APPS}})) {
  if (data.hidden || !data.category || data.parent) {
    continue;
  }
  
  if (!{{Common.AllAppPermissions}}[uuid].view) {
    continue;
  }
  
  let categoryList = result[data.category];
  if (!categoryList) {
    categoryList = [];
    result[data.category] = categoryList;
  }

  if (data.url) {
    data.type = "external_link";
  } else if (uuid == activeUuid) {
    data.type = "active_link";
  } else {
    data.type = "link";
  }

  data.url = data.url || `https://retool.fortistools.games/apps/${uuid}`;
  
  categoryList.push(data);
}

return result;