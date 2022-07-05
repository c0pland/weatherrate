//
//  Weather.swift
//  weatherrate
//
//  Created by Bogdan Benner on 04.07.2022.
//

import Foundation
import SwiftyJSON

class Weather {
    var finished = false
    var apiLaunched = false
    let API = "a235834f9c5e4fe989c103052220407"
    func getTemp(for location: String) {
        let URLLocation = location.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "!*'();:@&,/?%#[] \"").inverted)
        let requestURL = "http://api.weatherapi.com/v1/current.json?key=\(API)&q=\(URLLocation!)"
        if let url = URL(string: requestURL) {
            URLSession.shared.dataTask(with: url) { data, respons, error in
                if error !=  nil {
                    print("API Error \(error)")
                } else {
                    if data != nil {
                        do {
                            let json = try JSON(data: data!)
                            let locationName = json["location"]["name"]
                            let locationRegion = json["location"]["region"]
                            let locationCountry = json["location"]["country"]
                            let locationTime = json["location"]["localtime"]
                            let currentTemp = json["current"]["temp_c"]
                            let currentCondition = json["current"]["condition"]["text"]
                            let conditionEmoji = self.getEmoji(for: currentCondition.string!)
                            let tempFeelsLike = json["current"]["feelslike_c"]
                            let humidity = json["current"]["humidity"]
                            let result = "Weather for \(locationName), \(locationRegion), \(locationCountry):\nCondition: \(currentCondition)\(conditionEmoji)\nCurrent temperature: \(currentTemp)°C\nFeels like \(tempFeelsLike)°C\nHumidity: \(humidity) mm hg\nLocal time and date: \(locationTime)"
                            print(result)
                        } catch {
                            print("Error creating a JSON object \(error)")
                        }
                    }
                    else {
                        print("Got nil")
                    }
                }
                self.finished = true
            }.resume()
        } else {
            self.finished = true
        }
    }
    
    func getEmoji(for condition: String) -> String {
        if condition.lowercased().contains("clear") || condition.lowercased().contains("sunny") {
            return "☀️"
        }
        if condition.lowercased().contains("rain") {
            return "🌧"
        }
        if condition.lowercased().contains("thunder") {
            return "⛈"
        }
        if condition.lowercased().contains("snow") {
            return "❄️"
        }
        return "🌍"
    }
}
