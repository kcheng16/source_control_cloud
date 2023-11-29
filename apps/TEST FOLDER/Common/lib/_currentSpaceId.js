// Returns the space ID of the currently-selected space, or undefined if none is selected.
return {{current_user}}.groups.find(group => group.name === {{_currentSpaceKey.value}})?.id;