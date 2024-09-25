return {{ [
  {label: "All", value: ""},
  ...providerQuery.data.map(p => ({label: p, value: p}))
]
}}