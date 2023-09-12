external fetch: (. string, Js.Json.t) => promise<unknown> = "fetch"

module Response = {
    let ok: unknown => bool = %raw("(response) => response.ok")
    let text: unknown => promise<string> = %raw("(response) => response.text()")
    let headers: Js.Json.t = %raw(`{
        "Content-Type": "text/html; charset=UTF-8",
        "Accept:": "text/html"
    }`)
}

module Scraper = {
    let getCursor = (content) => {
        switch (
            %re("/<\s*a\s+class=\"button is-success\"\s+href=\"\?cursor=(\d+)\"\s*>Next<\s*\/a\s*>/")
                -> Js.String.match_(content)
        ) {
            | Some(arr) => arr[1]
            | None => None
        }
    }

    let getVideos = (content, user) => {
        let match = `href="https://www.tiktok.com/${user}/video/(\\d+)"`
        let matches = []

        // get all matches from content, extract video IDs from matches
        switch (
            match
                -> Js.Re.fromStringWithFlags(~flags="g")
                -> Js.String.match_(content)
        ) {
            | Some(arr) => arr
            | None => []
        } |> Array.iter(url => switch (
            match
                -> Js.Re.fromString
                -> Js.String.match_(url -> Belt.Option.getUnsafe) // allowed because 'g' flag used (no optional parenthesis)
        ) {
            | Some(arr) => {
                let  _ = matches |> Js.Array.push(arr[1] -> Belt.Option.getUnsafe) // allowed because no optional parenthesis
            }
            | None => ()
        })

        matches
    }
}

let getUserFeed = async (user, cursor) => {
    let { instance } = await Storage.Settings.read()
    let response = await fetch(. `https://${instance}/${user}?cursor=${cursor}`, Response.headers)

    // verify instance response was ok
    if !Response.ok(response) {
        Js.Exn.raiseError("Response wasn't OK retrieving user feed")
    }

    // scrape content
    let content = await Response.text(response)
    let cursor = Scraper.getCursor(content)
    let videos = Scraper.getVideos(content, user)

    (cursor, videos)
}