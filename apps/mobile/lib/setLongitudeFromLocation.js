let currPost = await utils.getCurrentPosition();
//await varCurrPosition.setValue(currPost);

txtLongitude.setValue(currPost.coords.longitude);