# calculator_app

An application is where you can perform all calculations using
state management approach (GetX). Not by using setState.

## Requirement

1. Operations like Addition, subtraction, multiplication, division, percentage,
   positive and negative, option to clear
2. Maintain history of last 10 calculations using local DB or Firebase and option
   clear the history
3. UI should be matching below layout and should support dark mode.

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/amitmallah0509/calculator_app.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get
```

**Step 3:**

This project uses `inject` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

**Step 4:**

To Run project on device the following command:

```
flutter run
```

## Calculator Features:

- Addition
- Subtraction
- Multiplication
- Percentage
- Positive/Negative
- Option to clear

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
|- controllers/
|- helper/
|- models/
|- pages/
|- widgets/
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- controllers - controllers are observer of view who can calculate data and show to view;
2- helpers - Contains the utilities/common functions of your application.
3- models - The model represents a single source of truth that carries the local database related queries. This layer interacts with controller for local data or for real-time. Data are given in response to views.
4- pages — Contains all the ui of your project, contains sub directory for each screen.
5- widgets — the common widgets for your applications. For example, Button, TextField etc.
8- main.dart - This is the starting point and root widget of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```
