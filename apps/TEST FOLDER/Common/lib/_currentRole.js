// Returns the current role object, or an empty object if there is currently no role.
if (!{{_currentRoleKey.value}}) {
  return {};
}
return {{_ROLES.value}}[{{_currentRoleKey.value}}];