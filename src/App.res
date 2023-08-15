open ReactNative
open Style

let style = Style.viewStyle(
  ~width = 100. -> pct,
  ~height = 100. -> pct,
  ()
)

@react.component
let app = () => {
  <View>
    <Video
      resizeMode="contain"
      style={style}
      source={{uri: "https://proxitok.pabloferreiro.es/download?url=https%3A%2F%2Fwww.tiktok.com%2F%40holyexpertcar%2Fvideo%2F7206820052929301806&id=7206820052929301806&user=holyexpertcar"}}
      />
  </View>
}