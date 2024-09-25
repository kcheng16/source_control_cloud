// remove opportunity from model
opportunities.setValue(
  opportunities.value.filter(o => !opportunitiesToReject.value.some(x => x.id === o.id)));
opportunitiesToReject.setValue([]);
rejectModal.hide();
approveModal.hide();
hideEditFrame.trigger();