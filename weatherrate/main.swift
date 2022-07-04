//
//  main.swift
//  weatherrate
//
//  Created by Bogdan Benner on 04.07.2022.
//

import Foundation

let yandexWeatherAPI = "9e00be46-53d1-4caa-b0be-f618bfa6cac1"
//for arg in CommandLine.arguments {
//    print(arg)
//}

let weather = Weather()
while !weather.finished {
    if !weather.apiLaunched {
        weather.getTemp(for: "Tulsa")
        weather.apiLaunched = true
    }
}
