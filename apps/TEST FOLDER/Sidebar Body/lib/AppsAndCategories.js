// Returns a flattened list of categories and apps, for display in a listview.
let result = [];

for (const [category, apps] of Object.entries({{AppsByCategory.value}})) {
  result.push({
    name: category.toUpperCase(),
    type: "category",
  });  
  result = result.concat(apps);
}

return result;