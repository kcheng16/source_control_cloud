// Redirects to the landing page if the user does not have available spaces, their spaces do not include the current space, or does not have view permissions for the current app.
// Includes the app ID in the errorAppId query param
// Automatically runs on page load when not in editor mode and not on the landing page.

if (retoolContext.inEditorMode || retoolContext.appUuid === 'b59b40ce-d26a-11ed-aece-7301caeae6e8') return

if (
  !_availableSpaceKeys.value.includes(_currentSpaceKey.value) ||
  !_currentAppPermissions?.value?.view
) {
  utils.openApp(
    "b59b40ce-d26a-11ed-aece-7301caeae6e8",
    { queryParams: { errorAppId: retoolContext.appUuid } }
  );
}