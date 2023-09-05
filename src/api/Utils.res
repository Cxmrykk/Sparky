let organisedFeed = (followers, available) => {
    ()
}

let getUserFeed = async (follower, available) => {
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
}

let getFeed = async () => {
    let followers = await Storage.Followers.read()

    // allocate an array for each user
    let available = followers
        -> Array.length
        -> Array.init(_ => [])

    // wait for all user feeds to load
    let feed = (followers |> Array.mapi((index, follower) => getUserFeed(follower, available[index])))
    let _ = await feed -> Js.Promise.race

    // spread out feed items equally
    organisedFeed(followers, available)
}