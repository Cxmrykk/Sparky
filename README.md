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

### Todo
- ✅ Local storage (Users, History, Settings)
- ✅ Proxitok user feed video link extraction "@user/video/" (Video URL, poster URL)
- Video Content (Comments, Tags, Profile)

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
