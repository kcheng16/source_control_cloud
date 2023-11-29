// Returns the set of permissions for the currently open app.
// e.g. { "view": true, "edit": true }
// Returns undefined if no permissions have been defined for the current app.

return {{_allAppPermissions.value}}[{{retoolContext.appUuid}}];