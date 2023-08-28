type asyncStorage = {
    getItem: string => promise<Js.Null.t<string>>,
    setItem: (string, string) => promise<unit>
}

@module("@react-native-async-storage/async-storage") external asyncStorage: asyncStorage = "default"
let { getItem, setItem } = asyncStorage