<GlobalFunctions>
  <RESTQuery
    id="query1"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isImported={true}
    playgroundQueryName="get_new_gif"
    playgroundQueryUuid="219c20b2-959e-4cfc-be47-4045fac120ac"
    query="https://api.giphy.com/v1/gifs/random?api_key=Pt8BQn7MMyuUDlQW5xvuF2vDU5q8WFJa&tag=&rating=g"
    resourceName="REST-WithoutResource"
    retoolVersion="2.116.1"
    transformer="// Query results are available as the `data` variable
return data"
  />
  <RESTQuery
    id="query2"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    notificationDuration={4.5}
    query="https://www.httpbin.org/get"
    resourceName="REST-WithoutResource"
    transformer="// Query results are available as the `data` variable
return data"
  />
</GlobalFunctions>
