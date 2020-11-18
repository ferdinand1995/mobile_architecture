# Mobile Architecture Sample
A sample app to demonstrate Mobile Architecture implementation in iOS

## Project Description

This project contains mini demonstration on consuming public API with simple MVVM Pattern.
Build using Xcode 12 & Swift 5

### MVVM Architecture

MVVM (Model-View-ViewModel) is derived from MVC(Model-View-Controller).
It is introduced to solve existing problems of Cocoa's MVC architecture in iOS world.
One of its feature is to make a better seperation of concerns so that it is easier to maintain and extend.
* Model: It is simillar to `model` layer in MVC (contains data business logic)
* View: UIViews + UIViewControllers (We treat both layout view and controllers as View)
* ViewModel: A mediator to glue two above layer together.

An important point in MVVM is that it uses a binder as communication tool between View and ViewModel layers.
A technique named `Data Binding` is used.

#### Overview App Architecture Pattern

What is a design pattern? This is a reusable solution to common problems in app development. 
Patterns help developers write the clear and easy-to-use code.

Basically the purpose of MVVM is to reduce the responsible on view side making it smaller and less boiler-plate.
Since it was derived from MVC, there are pros and cons to working with MVVM.  Due to the decoupling of UI and business logic, the MVVM design pattern results in more flexible and easier-to-read classes

### 3rd Party

* [Kingfisher](https://github.com/onevcat/Kingfisher) to perform downloading and caching images from the web.
* [Reachability](https://github.com/ashleymills/Reachability.swift) to perform checked on Internet Connection.
