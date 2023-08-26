open ReactNative
open Style

let getViewStyle = (width, height) => {
    Style.viewStyle(
    ~width = width -> dp,
    ~height = height -> dp,
    ()
  )
}

let videoStyle = Style.viewStyle(
  ~flex = 1.0,
  ()
)

module Test = {
  @react.component
  let make = () => {
    let (p, setP) = React.useState(() => false)

    <Pressable
      onPress={_ => setP(value => !value)}
      style={_ => videoStyle}
    >
      {(_) => <Video
        paused=p
        repeat=true
        style=videoStyle
        resizeMode="contain"
        poster="https://proxitok.pussthecat.org/stream?url=https%3A%2F%2Fp16-sign-sg.tiktokcdn.com%2Fobj%2Ftos-alisg-p-0037%2F43f86b1f141c4403a0f1e925966191bf_1689350251%3Fx-expires%3D1692774000%26x-signature%3DL964OXQHcyliU5JDMVen63N2cgo%253D"
        source={{uri: "https://proxitok.pussthecat.org/download?url=https%3A%2F%2Fwww.tiktok.com%2F%40static_wagz%2Fvideo%2F7255704052594429202&id=7255704052594429202&user=static_wagz"}}
      />}
    </Pressable>
  }
}



@react.component
let app = () => {
  let dimensions = Dimensions.get(#window)
  <View style=getViewStyle(dimensions.width, dimensions.height)>
    <Test />
  </View>
}