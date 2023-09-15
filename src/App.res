@react.component
let app = () => {
  <PaperProvider>
    <Appbar.Header>
      <Appbar.Content title="Hello!" />
      <Appbar.Action icon="calendar" onPress={() => Js.log("Hello!")}/>
    </Appbar.Header>
  </PaperProvider>
}