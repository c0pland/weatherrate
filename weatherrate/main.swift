//
//  main.swift
//  weatherrate
//
//  Created by Bogdan Benner on 04.07.2022.
//

import Foundation

let weather = Weather()
var location = ""
if CommandLine.arguments.count <= 1 {
    print("Provide a location (e.g. weatherrate Novosivirsk).")
    weather.finished = true
} else {
    for arg in CommandLine.arguments {
        if CommandLine.arguments[0] == arg {
            continue
        }
        location += arg + " "
    }
}
location = location.trimmingCharacters(in: .whitespacesAndNewlines)
print("Location: \(location)")

while !weather.finished {
    if !weather.apiLaunched {
        weather.getTemp(for: location)
        weather.apiLaunched = true
    }
}
