# Modern-SwiftUI-MVVM-With-Tests-Recipes-App

An app to show modern iOS app development: SwiftUI + Combine on MVVM With Tests

A repository to show modern MVVM with SwiftUI and automated unit tests and UI tests.

Tech Stack: Swift, SwiftUI, Combine 
Architecture: MVVM

Basically fetches data from Contentful API. Applies paging of 30 items. Fetches next page whenever users scrolls to the bottom. On Detail screen, shows recipe's details on a sheet.

API keys are stores in Plist files. All the code is testable. Unit tests and UI tests are provided and fully working.

UI is adaptive. When iPhone/iPad is rotated, column count will increase to fill the screen. Also UI is adaptive for iPads.
