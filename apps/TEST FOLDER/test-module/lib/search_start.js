(function () {
  const value = gsearch.value.trim();

  search_button.loading = true;

  const curUrl = urlparams.href;
  function getNextUrl(path) {
    return 'https://retool.internal.api.openai.org/apps/' + path;
  }

  if (value.includes("@")) {
    search_user_email.trigger({
      onSuccess: function (user) {
        const nextUrl = getNextUrl(`api-admin-user?user_id=${user.id}`);
        utils.openUrl(nextUrl, {newTab: false, forceReload: true});
      },
    });
  } else if (value.indexOf("org-") === 0) {
    // Show org result
    const nextUrl = getNextUrl(`api-admin-org?org_id=${value}`);
    utils.openUrl(nextUrl, {newTab: false, forceReload: true});
  } else if (value) {
    // First try to search it as an org name. This allows us to capture either real org names,
    // or person orgs (lowercase user public ID)
    search_org_name.trigger({
      onSuccess: function (orgs) {
        const nextUrl = getNextUrl(`api-admin-org?org_id=${orgs.data[0].id}`);
        utils.openUrl(nextUrl, {newTab: false, forceReload: true});
      },
      onFailure: function (error) {
        // Maybe it's a normal, user ID?
        if (value.indexOf("user-") === 0) {
          const nextUrl = getNextUrl(`api-admin-user?user_id=${value}`);
          utils.openUrl(nextUrl, {newTab: false, forceReload: true});
          return;
        }
        // Otherwise show error message
        let errorMessage;
        try {
        	let data = JSON.parse(error).data;
          errorMessage = JSON.parse(data.message).error.message;  
        } catch(e) {}
        
        utils.showNotification({
          title: "Whoops",
          description: errorMessage || 'Unknown error',
          notificationType: "error",
        });
      },
    });
  } else {
    utils.showNotification({
      title: `Please enter a search term`,
      description: "",
      notificationType: "error",
    });
  }
})();
