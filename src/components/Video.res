type source = {
    uri: string
}

@react.component @module("react-native-video")
external make: (
    ~source: source=?,
    ~style: 'a=?,
    ~controls: bool=?,
    ~resizeMode: string=?,
) => React.element = "default"