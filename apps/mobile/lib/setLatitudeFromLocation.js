let currPost = await utils.getCurrentPosition();
//await varCurrPosition.setValue(currPost);

txtlatitude.setValue(currPost.coords.latitude);