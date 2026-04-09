<Container
  id="container38"
  disabled="{{ GetCartForPayment.isFetching }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hoistFetching={true}
  loading="{{ GetCartForPayment.isFetching }}"
  marginType="normal"
  padding="12px"
  showBody={true}
  style={{ ordered: [{ borderRadius: "16px" }] }}
>
  <Header>
    <Text
      id="containerTitle44"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="aa61c" viewKey="View 1">
    <Text
      id="text81"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.92)" }] }}
      value={'<h4 style="font-weight:500;">Payment Option</h4>'}
      verticalAlign="center"
    />
    <Text
      id="text82"
      hidden="true"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.92)" }] }}
      value={'<h6 style="font-weight:500;">Payment Option</h6>'}
      verticalAlign="center"
    />
    <Include src="./container39.rsx" />
    <Image
      id="image22"
      dbBlobId="30fddeab-7abf-4ffc-843a-363ba710f99a"
      fit="contain"
      heightType="fixed"
      hidden="true"
      horizontalAlign="center"
      marginType="normal"
      src="https://ik.imagekit.io/xp8c4ep1p/Society%20Store/Payment%20options/QR%20icon.png?updatedAt=1743165137404"
    />
    <TextInput
      id="phoneInput6"
      disabled="true"
      hidden="true"
      label="Phone Number"
      labelPosition="top"
      marginType="normal"
      pattern="^[a-zA-Z0-9\s]*$"
      placeholder="Enter Phone Number"
      style={{
        ordered: [
          { sharedLabel: "rgba(2, 6, 12, 0.6)" },
          { borderRadius: "10px" },
        ],
      }}
      value={
        '{{ maskMobileNumber(localStorage?.values?.userData?.mobile || "") }}'
      }
    />
    <Image
      id="image23"
      dbBlobId="29d3c6ee-6bab-457d-bf94-ce41b947a393"
      fit="contain"
      heightType="fixed"
      hidden="true"
      horizontalAlign="center"
      marginType="normal"
      retoolFileObject=""
      src="https://ik.imagekit.io/xp8c4ep1p/Society%20Store/Payment%20options/Frame%201686558598.png?updatedAt=1743165137514"
    />
    <Button
      id="button21"
      disabled="true"
      hidden="true"
      marginType="normal"
      style={{
        ordered: [{ borderRadius: "10px" }, { background: "rgb(255, 82, 0)" }],
      }}
      text={
        '{{ paymentOptionsDisabled4.selectedIndex === 0 ? "Generate QR" : ( paymentOptionsDisabled4.selectedIndex === 1 ? "Choose Cash" : "Choose Cash On Delivery" ) }}'
      }
    />
  </View>
</Container>
