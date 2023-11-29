// Returns the numeric role ID of the current user, determined by current_user.groups.
// If multiple roles match, the first one in ROLES is returned.
// If no matching role exists, returns undefined.
for (const roleKey of Object.keys({{_ROLES.value}})) {
  const role = {{current_user}}.groups.find(group => group.name === roleKey);
  if (role) {
    return role.id;
  }
}
return undefined;