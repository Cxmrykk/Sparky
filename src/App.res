open ReactNative

@react.component
let app = () => {
  <Text>
    {"Hello, world!" -> React.string}
  </Text>
}