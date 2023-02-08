# CRM Sample

A CRM Sample created in flutter using Bloc.It has capabilty to manage task and convert to your own native language. clone the appropriate branches mentioned below:

## Getting Started

This project contains the minimal implementation required to . The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new project. By using boiler plate code as standard initializer, we can have same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/karansingla007/Trello-clone
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

**Step 3:**

This project uses `build_runner` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

## Boilerplate Features:

* Task ticket create, move, edit
* Routing
* Database
* Bloc (State Management)
* CSV Export
* Multilingual Support

### Up-Coming Features:

* Firebase Analytics
* Notifications

### Libraries & Tools Used

* [Database](https://pub.dev/packages/drift_sqflite)
* [Bloc](https://pub.dev/packages/flutter_bloc) (State Management)
* [Dependency Injection](https://pub.dev/packages/build_runner)
* [Multilingual Support](https://pub.dev/packages/intl)
* [CSV](https://pub.dev/packages/csv)


### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- blocs/
|- constants/
|- database/
|- multi_laguage/
|- src/
|- utils/
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- blocs - Contains related all bussiness logic for state-management wigets.
1- constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `preferences` and `strings`.
2- database - Contains the database layer of your project, includes directories for local.
3- src - Contains all UI related wigets, dialog, screen of application. 
4- util — Contains the utilities/common functions of your application.
5- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### blocs

All the business logic of your application will go into this directory, it represents the data layer of your application. It is sub-divided into four directories `bloc`, `event` and `state`, each containing the domain specific logic. Since each layer exists independently, that makes it easier to unit test. The communication between UI and data layer is handled by using central repository.


```
blocs/
|- *.dart
|- *_bloc.dart
|- *_event.dart
|- *_state.dart
```

### Constants

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```
constants/
|- constant.dart
|- shared_pref_constant.dart
|- strings.dart
```

### Databases

```
*/
|- daos
|- db
|- model
|- tables

```

### src

This directory contains all the ui of your application. Each screen is located in a Screens folder making it easy to find all screens at one place and more clear. All the screen specific widgets will be placed in `widgets` directory as shown in the example below:

```
src/
|- atoms
   |- heading_text.dart
   |- mini_text.dart
|- dialogs
   |- language_option_dialog.dart
   |- task_create_dialog.dart 
|- molecule
   |- app_bar_base.dart
   |- circular_initials_name.dart 
|- screens
   |- home_screen.dart
|- widgets
   |- create_task_card.dart
|- 
```

### Utils

Contains the common file(s) and utilities used in a project. The folder structure is as follows:

```
utils/
|- permission_handler.dart
|- time_util.dart
|- util.dart
```

## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with this then please feel free to submit an issue and/or pull request 🙂

Again to note, this is example can appear as over-architecture for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.

## Sample Video

https://user-images.githubusercontent.com/26064126/215345744-e4128a96-7911-4757-873a-c487adb3202e.mp4

