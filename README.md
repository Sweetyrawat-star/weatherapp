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

#ScreenShot of App
Splash Screen ---------------------------------------------------------------------------------------------------------MainPage------------------------
![splash_Screen](https://github.com/Sweetyrawat-star/weatherapp/assets/57385799/ac1cc009-59d4-4927-94f9-f9422d20f621)
![main_page](https://github.com/Sweetyrawat-star/weatherapp/assets/57385799/af172b32-825b-4823-81bc-46cd06288233)

--------MainPage Data Loading ------------------------------------------------------------ --------City Weather Detail Page ---------------------------------


![main_page_data_loading](https://github.com/Sweetyrawat-star/weatherapp/assets/57385799/6490e45d-2aed-44d1-96e5-9fe6feb9ba27)
![weather_detail_pagee](https://github.com/Sweetyrawat-star/weatherapp/assets/57385799/d1ad9a47-0350-48dd-99cd-6698a3cd31dd)

----------------------------------------city Weather Detail Page -----------------------
![city_weather_detail_page](https://github.com/Sweetyrawat-star/weatherapp/assets/57385799/65e9e230-0600-4a99-812e-42bdc832861a)
