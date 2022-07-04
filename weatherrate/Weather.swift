//
//  Weather.swift
//  weatherrate
//
//  Created by Bogdan Benner on 04.07.2022.
//

import Foundation

class Weather {
    var finished = false
    var apiLaunched = false
    let API = "a235834f9c5e4fe989c103052220407"
    func getTemp(for location: String) -> String {
        if let url = URL(string: "http://api.weatherapi.com/v1/current.json?key=\(API)&q=\(location)") {
            URLSession.shared.dataTask(with: url) { data, respons, error in
                if error !=  nil {
                    print("API Error \(error)")
                } else {
                    print("OK")
                }
                self.finished = true
            }.resume()
        }
        return ""
    }
}
