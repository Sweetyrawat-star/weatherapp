# weatherapp

A new Flutter project.

## Getting Started

This project is a starting point for a weatherapp application.

I used clean architecture and bloc as state management tool dio for rest api call.

#feature 
[1] Splash screen with animation of what is your weather
[2] Main page which show you 6 city weather data with Animated list Scroll 
[3] City Detail Page show complete description about the weather with scroll of time 
[4] Fonts and assets/Icons used to show text and icons
[5] Having internet wifi permissions


# Architecture
data -> for api call and exception handling
domain -> repository implementation and usecases
presentation -> view and bloc implementation
dependencyInjection -> uses get_it plugin 
constants -> color and api constant files
exceptions -> error handling

# bloc
bloc
state
event 

# plugin Used
equatable: ^2.0.3
dartx: ^1.1.0
sqflite: ^2.2.8+4
dio: ^5.2.1+1
dartz: ^0.10.1
flutter_bloc: ^8.1.3
get_it: ^7.6.0
animated_text_kit: ^4.2.2
visibility_detector: ^0.4.0+2
intl: ^0.18.1




