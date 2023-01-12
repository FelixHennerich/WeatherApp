//
//  APIRequest.swift
//  Weather
//
//  Created by Felix Hennerich on 12.01.23.
//

import Foundation

let url = "https://api.openweathermap.org/data/2.5/weather?lat=48.21318441976442&lon=9.030872305354816&appid=ff0b85475d4b79d53e234ac28d93f240"
let iconurl = "http://openweathermap.org/img/wn/10d@2x.png"

func getData(){
    URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
        guard let data = data, error == nil else {
            print("error")
            return
        }
        
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
        print("It's \(a)°")
        temp += Int(a)
        name = json.name
        country = json.sys.country
        
        
    }).resume()
}


var temp: Int = 0
var name: String = ""
var country: String = ""
var icon: String = ""

struct Response: Codable {
    let main: Main
    let sys: Sys
    let name: String
}

public struct Main: Codable{
    let temp: Double
    let humidity: Int
}
public struct Sys: Codable{
    let country: String
}
public struct Weather: Codable{
    struct Zero: Codable{
        let icon: String
    }
    let zero: [Zero]
}
