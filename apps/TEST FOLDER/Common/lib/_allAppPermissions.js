// Returns a mapping from app UUID to the set of permissions allowed for that app for the current user.
// e.g. "some-app-uuid": { "view": true, "edit": true }

function permissionsForApp(uuid) {
  if (!{{_currentRoleKey.value}}) {
    // No role is assigned.  A role needs to be assigned to have permissions to anything!
    return {};
  }
  
  let permissions = {{_APPS.value}}[uuid];
  if (permissions.parent) {
    // This app is a child app; use permissions from the parent app.
    permissions = {{_APPS.value}}[permissions.parent];
  }
  
  if (!permissions.spaces.includes("any") && !permissions.spaces.includes({{_currentSpaceKey.value}})) {
    // The currently-selected space does not have any access to this app.
    return {};
  }
  
  return Object.keys(permissions.roles)
    .reduce((attrs, permission) => ({
        ...attrs,
        [permission]: permissions.roles[permission].includes("any") || permissions.roles[permission].includes({{_currentRoleKey.value}}),
      }),
    {}
  );
}

return Object.keys({{_APPS.value}})
  .reduce((attrs, uuid) => ({
        ...attrs,
        [uuid]: permissionsForApp(uuid),
      }),
    {}
  );