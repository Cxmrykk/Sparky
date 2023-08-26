type source = {
    uri: string
}

@react.component @module("react-native-video")
external make: (
    ~source: source=?,
    ~style: 'a=?,
    ~controls: bool=?,
    ~resizeMode: string=?,
    ~repeat: bool=?,
    ~poster: string=?,
    ~fullscreen: bool=?,
    ~paused: bool=?,
) => React.element = "default"