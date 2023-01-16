//
//  APIRequest.swift
//  Weather
//
//  Created by Felix Hennerich on 12.01.23.
//

import Foundation

public var lat = 48.21318441976442
public var lon = 9.030872305354816


let iconurl = "http://openweathermap.org/img/wn/10d@2x.png"

func getData(){
    print(lat)
    print(lon)
    let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=ff0b85475d4b79d53e234ac28d93f240"
    URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
        guard let data = data, error == nil else {
            print("error")
            return
        }
        
        
        //abc
        
        var result: Response?
        do{
            result = try JSONDecoder().decode(Response.self, from: data)
        }catch{
            print("Error\(error.localizedDescription)")
        }
            
        guard let json = result else{
            return
        }
        
        print(json.name)
        let a = round(json.main.temp - 273.15)
        let bmin = round(json.main.temp_min - 273.15)
        let cmax = round(json.main.temp_max - 273.15)

        print("It's \(a)°")
        temp = Int(a)
        temp_min = Int(bmin)
        temp_max = Int(cmax)
        name = json.name
        country = json.sys.country
        icon = json.weather[0].icon
        
        
    }).resume()
}


var name: String = ""
var temp: Int = 0
var temp_min: Int = 0
var temp_max: Int = 0
var country: String = ""
var icon: String = ""

struct Response: Codable {
    let main: Main
    let sys: Sys
    let name: String
    
    struct Weather: Codable{
        let icon: String
        let main: String
    }
    let weather: [Weather]
}

public struct Main: Codable{
    let temp: Double
    let humidity: Int
    let temp_min: Double
    let temp_max: Double
}
public struct Sys: Codable{
    let country: String
}
