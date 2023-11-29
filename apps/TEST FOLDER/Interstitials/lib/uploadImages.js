// Takes an image file map and kicks off the file uploads in parallel and returns response map

return await Promise.all(
  Object.entries(imageFileMap).map(
    async ([key, imageData]) => [
      key,
      await postImage.trigger({
        additionalScope: {
          imageData
        }
      })
    ]
  )
).then(Object.fromEntries)