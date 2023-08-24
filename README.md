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
- Subscription-based
- Cached content (Refresh will fetch URLs only)

### UI Milestones
| Component | Role | Status |
|---|---|---|
| Video Feed | Main Screen | Not Started |
| Following | Overlay Screen | Not Started |
| Settings | Overlay Screen | Not Started |
| Comments | Overlay | Not Started |
| Share | Overlay | Not Started |
