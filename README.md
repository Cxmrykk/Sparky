# Status
- ~~Development hiatus - waiting for [davidteather/TikTok-Api](https://github.com/davidteather/TikTok-Api) to implement support for new TikTok API~~
- Taking too long, will use [pablouser1/TikScraperPHP](https://github.com/pablouser1/TikScraperPHP) for continued support (see [Cxmrykk/TikTok-Server](https://github.com/Cxmrykk/TikTok-Server))

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

### Status
- Currently waiting on `Cxmrykk/TikTok-server` to be complete (Web server that serves JSON content from python scraper)
- Will rely on [pablouser1/ProxiTok](https://github.com/pablouser1/ProxiTok) as a workaround for downloading videos (See [davidteather/TikTok-Api](https://github.com/davidteather/TikTok-Api) issues: [1040](https://github.com/davidteather/TikTok-Api/issues/1040), [984](https://github.com/davidteather/TikTok-Api/issues/984))

### UI Milestones
| Component | Role | Status |
|---|---|---|
| Video Feed | Main Screen | Not Started |
| Following | Overlay Screen | Not Started |
| Settings | Overlay Screen | Not Started |
| Comments | Overlay | Not Started |
| Share | Overlay | Not Started |

### Video Feed
- Works in "pages" (once the end is reached, a new page will load)
- Only displays content not contained in history log
- Media controls:
  - Tap to pause
  - Long press to save
  - Swipe left/right to seek
  - Swipe up/down to scroll
