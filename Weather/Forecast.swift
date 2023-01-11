//
//  Forecast.swift
//  Weather
//
//  Created by Felix Hennerich on 11.01.23.
//

import Foundation

/*
 
 
 Location will be done by CoreLocation
 
 
 */

struct Forecast: Codable{
    struct Daily: Codable{
        let dt: Date
        struct Temp: Codable{
            let min: Double
            let max: Double
        }
        let temp: Temp
        let humidity: Int
        struct Weather: Codable{
            let description: String
            let icon: String
            var weatherIconURL: URL{
                let urlString = "http://openweathermap.org/img/wn/\(icon)@2x.png";
                return URL(string: urlString)!
            }
        }
        let weather: [Weather]
        let clouds: Int
        let pop: Double
    }
    let daily: [Daily]
}

let apiService = APIService.shared
let dateFormatter = DateFormatter()

func abcd() {
    dateFormatter.dateFormat = "E, MMM, d"

    apiService.getJSON(urlString: "https://api.openweathermap.org/data/3.0/onecall?lat=48.21318441976442&lon=9.030872305354816&exclude=current,minutely,hourly,daily&appid=cf3132ed19a74f78b2c28d4fc23785cc", dateDecodingStrategy: .secondsSince1970) { (result: Result<Forecast, APIService.APIError>)
        in
        switch result {
        case .success(let forecast):
            for day in forecast.daily{
                print(dateFormatter.string(from: day.dt))
                print("    Max: ", day.temp.max)
                print("    Min: ", day.temp.min)
                print("    Humidity: ", day.humidity)
                print("    Description: ", day.weather[0].description)
            }
        case .failure(let apiError):
            switch apiError{
            case .error(let errorString):
                print(errorString)
            }
        }
    }
}
