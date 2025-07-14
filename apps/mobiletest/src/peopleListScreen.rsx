<Screen
  id="peopleListScreen"
  title="People List"
  uuid="d59fc6ff-404b-470c-a95a-211f2ec5657f"
>
  <Scanner
    id="scanner1"
    autoClose={true}
    buttonSize="large"
    buttonText="Scanner"
    data="[]"
    ratio={1}
  />
  <Text
    id="text2"
    markdown={true}
    size="medium"
    value="{{ JSON.stringify(scanner1.data) }}"
    weight="normal"
  />
</Screen>
