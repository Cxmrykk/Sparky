module Follower = {
    type historyEntry = {
        path: string,
        date: float,
    }

    type history = array<historyEntry>

    type follower = (string, history)

    @scope("JSON") external parse: string => history = "parse"
    @scope("JSON") external stringify: history => string = "stringify"

    let write = async ((name, history): follower) => {
        await AsyncStorage.setItem(`@storage/follower/${name}`, stringify(history))
    }

    let read = async (name: string) => {
        parse((await AsyncStorage.getItem(`@storage/follower/${name}`))
            -> Js.Null.toOption
            |> Js.Option.getWithDefault("[]"))
    }
}

module Followers  = {
    type follower = Follower.follower

    type t = {
        followers: array<follower>
    }

    @scope("JSON") external parse: string => array<string> = "parse"
    @scope("JSON") external stringify: array<string> => string = "stringify"

    let write = async (followers: array<follower>) => {
        let namelist = []
        followers |> Array.iter(((name, _)) => {
            let _ = namelist |> Js.Array.push(name)
        })
        await AsyncStorage.setItem("@storage/followers", stringify(namelist))
    }

    let read = async () => {
        parse((await AsyncStorage.getItem("@storage/followers"))
            -> Js.Null.toOption
            |> Js.Option.getWithDefault("[]"))
    }
}

module Saved = {
    @scope("JSON") external parse: string => array<string> = "parse"
    @scope("JSON") external stringify: array<string> => string = "stringify"

    let write = async (saved: array<string>) => {
        await AsyncStorage.setItem("@storage/saved", stringify(saved))
    }

    let read = async () => {
        parse((await AsyncStorage.getItem("@storage/saved"))
            -> Js.Null.toOption
            |> Js.Option.getWithDefault("[]"))
    }
}

module Settings = {
    type t = {
        instance: string
    }

    let defaults = {
        instance: "https://proxitok.pussthecat.org/"
    }

    @scope("JSON") external parse: string => t = "parse"
    @scope("JSON") external stringify: t => string = "stringify"

    let read = async () => {
        instance: (await AsyncStorage.getItem("@storage/settings/instance"))
            -> Js.Null.toOption
            |> Js.Option.getWithDefault(defaults.instance),
    }

    let write = async (settings: t) => {
        await AsyncStorage.setItem("@storage/settings/instance", settings.instance)
    }
}