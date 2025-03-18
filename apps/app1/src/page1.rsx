<Screen
  id="page1"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title="Page 1"
  urlSlug=""
>
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    type="main"
  >
    <Button id="button1" text="Button" />
    <Image
      id="image1"
      heightType="fixed"
      horizontalAlign="center"
      src="https://picsum.photos/id/1025/800/600"
    />
    <Date
      id="date1"
      customValidation="{{ self.value.add(1, 'months') }}"
      dateFormat="MMM d, yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      iconBefore="bold/interface-calendar"
      labelPosition="top"
      value="{{ new Date() }}"
    />
  </Frame>
</Screen>
