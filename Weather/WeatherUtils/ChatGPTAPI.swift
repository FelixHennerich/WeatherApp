//
//  ChatGPTAPI.swift
//  Weather
//
//  Created by Felix Hennerich on 12.01.23.
//

import Foundation

let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=48.21318441976442&lon=9.030872305354816&appid=ff0b85475d4b79d53e234ac28d93f240"

func getJSON(){
    URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
      if let error = error {
        print(error)
        return
      }

      guard let data = data else {
        print("No data")
        return
      }

        let json: String
        
        
        do {
            json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            //let userId = json["userId"] as! Int
            let title = json["name"] as! String
            let abcd = json["id"] as! Int
            print()
          } catch {
            print(error)
          }
    }.resume()
}


