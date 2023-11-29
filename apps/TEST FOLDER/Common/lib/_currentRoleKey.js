// Returns the role key of the current user, determined by current_user.groups.
// If multiple roles match, the first one in ROLES is returned.
// If no matching role exists, returns undefined.
for (const roleKey of Object.keys({{_ROLES.value}})) {
  if ({{current_user}}.groups.some(group => group.name === roleKey)) {
    return roleKey;
  }
}
return undefined;