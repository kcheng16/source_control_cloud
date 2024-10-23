const baseURL = "https://spothero.retool.com/apps/";
const custCancelId = "eee5f1d2-dfb5-11ed-ae65-b3bc9ae706eb/Marketplace%20Operations/Customer%20Cancel%20Hero%20Interface#";
const lotFullId = "749a7e98-7bbf-11ed-9f63-830390ff0a1c/Marketplace%20Operations/Lot%20Full%20Not%20Accepted%20Hero%20Interface#";
const equipmentErrorId = "6227fb2a-f4c6-11ed-820c-176aafd31d0b/Marketplace%20Operations/Equipment%20Error%20Hero%20Interface#";
const onsiteChangeId = "7039c81a-f4c6-11ed-bc22-4396f79cb1f9/Marketplace%20Operations/OnSite%20Change%20Hero%20Interface#";
const prePurchaseId = "5ed1b664-1c35-11ee-83a9-3bf3121b106a/Marketplace%20Operations/PrePurchase%20Hero%20Interface#"

const callTime = {{callTime.value}};
const interactionId = {{interactionId.value}};
const searchTerm = {{customerEmail.value}};
const RID = {{reservationForCase.value}};

return {
  onsiteChangeURL : `${baseURL}${onsiteChangeId}RID=${RID}&searchTerm=${searchTerm}&interactionId=${interactionId}&callTime=${callTime}`,
  lotFullURL : `${baseURL}${lotFullId}RID=${RID}&searchTerm=${searchTerm}&interactionId=${interactionId}&callTime=${callTime}`,
  equipmentErrorURL : `${baseURL}${equipmentErrorId}RID=${RID}&searchTerm=${searchTerm}&interactionId=${interactionId}&callTime=${callTime}`,
  custCancelURL : `${baseURL}${custCancelId}RID=${RID}&searchTerm=${searchTerm}&interactionId=${interactionId}&callTime=${callTime}`,
  prePurchaseURL : `${baseURL}${prePurchaseId}RID=${RID}&searchTerm=${searchTerm}&interactionId=${interactionId}&callTime=${callTime}`
}