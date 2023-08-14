type source = {
    uri: string
}

@react.component @module("react-native-video")
external make: (~source: source=?) => React.element = "default"