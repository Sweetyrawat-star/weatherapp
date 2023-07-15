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



|  Splash Screen                                              |                                                   Weather of City View Loaded                               
|:----------------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------:|
| <img width alt="Screen Shot 2020-09-17 at 3 26 13 PM" src="https://github.com/Sweetyrawat-star/weatherapp/assets/57385799/42712fee-37b8-409d-9487-b324c14f0973.png">|<img alt="Screen Shot 2020-09-17 at 3 35 48 PM" src="https://github.com/Sweetyrawat-star/weatherapp/assets/57385799/7c353c75-76ba-4b9c-8239-628fbb2cca04.png">|


|  Weather of City View                                              |                                                   Weather of City Description Loaded                               
|:----------------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------:|
| <img width alt="Screen Shot 2020-09-17 at 3 26 13 PM" src="https://github.com/Sweetyrawat-star/weatherapp/assets/57385799/23deae4e-7745-49d1-b414-9aa362fd3b47.png">|<img alt="Screen Shot 2020-09-17 at 3 35 48 PM" src="https://github.com/Sweetyrawat-star/weatherapp/assets/57385799/42b74595-4bb0-440c-8dd5-608588124d69.png">|


|  Weather of City Description   |                                               
| <img width alt="Screen Shot 2020-09-17 at 3 26 13 PM" src="https://github.com/Sweetyrawat-star/weatherapp/assets/57385799/27f83c8f-140e-4bb2-bd0e-1c8ffd0cb89a.png">|


