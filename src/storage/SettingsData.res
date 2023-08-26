type t = {
    instance: string
}

let defaults = {
    instance: "https://proxitok.pussthecat.org/"
}

@scope("JSON") external parse: string => t = "parse"
@scope("JSON") external stringify: t => string = "stringify"

let read = async () => {
    instance: (await ReactNativeAsyncStorage.getItem("@settings/instance"))
        -> Js.Null.toOption
        |> Js.Option.getWithDefault(defaults.instance),
}

let write = async (settings: t) => {
    await ReactNativeAsyncStorage.setItem("@settings/instance", settings.instance)
    ()
}