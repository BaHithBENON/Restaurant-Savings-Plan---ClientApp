# Restaurant-Savings-Plan - ClientApp
Visual client of the restaurant savings plan system

## Description

Flutter application for consuming microservices of the restaurant loyalty network. The source code of the microservices can be found at the following link.

## Features
- Create, update restaurants, rewards, accounts, and their beneficiaries.
- Calculate benefits based on the cost of a dinner.
- Distribute rewards to beneficiaries.

## Prerequisites 
- `Flutter` & `Dart` environment
- `Java` + `SpringBoot` environment
- Servers and microservices 
    - Git: [Restaurant-Savings-Plan Repository](https://github.com/BaHithBENON/Restaurant-Savings-Plan)

## Getting Started
- Run `flutter clean` and then `flutter run`
- A Windows version is available in the directory
    - `.exe` **build\windows\x64\runner\Release\restaurant_savings_plan.exe**
    - The default port used in the code is `8765`, which is the port of the microservices gateway. Check the source code if you want to change it according to your preferences and then recompile the application.

## Routes
- You can find documentation of the routes in the files `routes_fr` for French and `routes_en` for English.