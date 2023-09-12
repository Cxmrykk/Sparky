type feedItem = {
    user: string,
    url: string
}

let organised = (followers, available) => {
    let organised = list{} -> ref
    let continue = true -> ref

    // continue until all arrays are empty
    while continue.contents {
        continue := false
        available |> Array.iteri((index, feed) => {
            switch Js.Array.pop(feed) {
                | Some(value) => {
                    continue := true
                    organised := list{{
                        user: followers[index],
                        url: value
                    }, ...organised.contents}
                }
                | None => ()
            }
        })
    }

    organised.contents
}

let user = async (follower) => {
    let available = []
    let history = await Storage.Follower.read(follower)
    let current = Some("0") -> ref

    // continue until new videos are discovered
    while Array.length(available) == 0 && Belt.Option.isSome(current.contents) {
        let cursor = current.contents -> Belt.Option.getUnsafe
        let (next, videos) = await Api.getUserFeed(follower, cursor)

        // append video if not in history
        videos |> Array.iter(video => {
            if !(history -> Belt.Set.has(video)) {
                let _ = available |> Js.Array.push(video)
            }
        })

        // update the URL cursor
        current := next
    }

    available
}

let getLatest = async () => {
    let followers = await Storage.Followers.read()

    // wait for all user feeds to load
    let feed = followers |> Array.map(follower => user(follower))
    let available = await Js.Promise.all(feed)

    // spread out feed items equally
    organised(followers, available)
}