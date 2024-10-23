<App>
  <Include src="./functions.rsx" />
  <UrlFragments
    id="$urlFragments"
    value={{ ordered: [{ my_selection: "{{.value}}" }] }}
  />
  <Include src="./header.rsx" />
  <Frame
    id="$main"
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    sticky={false}
    type="main"
  />
</App>
