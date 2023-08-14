### Building
Minimum requirements are `npm` and `git` installed on the user's system
```sh
git clone https://github.com/Cxmrykk/Sparky.git
cd Sparky
npm install # install dependencies
npx rescript # compile ReScript to JS
npx react-native start # start testing environment
```
Whenever changes are made, make sure to re-compile ReScript code to JS using
```sh
npx rescript
```
(This is done automatically in Visual Studio Code using the [ReScript](https://github.com/rescript-lang/rescript-vscode) extension)

### Concepts
#### Feeds
- Add users, tags
- Whitelist/Blacklist posts with certain tags
- Each feed has its own users and tags. (Configurable by user)
