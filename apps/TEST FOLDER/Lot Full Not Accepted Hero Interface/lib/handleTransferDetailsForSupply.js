if (localStorage.values.detailsForSupplyTeam === ""){
  return
} else {
  transferDetailsForSupply.setValue(localStorage.values.detailsForSupplyTeam)
  localStorage.setValue("detailsForSupplyTeam", "")
}