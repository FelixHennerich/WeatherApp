//
//  LocationService.swift
//  Weather
//
//  Created by Felix Hennerich on 13.01.23.
//

import Foundation


/*
 
 Link: http://api.openweathermap.org/geo/1.0/direct?q=London&limit=5&appid=ff0b85475d4b79d53e234ac28d93f240
 
 */


public func getNewLocationData(city: String){
    var i = 0
    let coordUrl = "https://api.openweathermap.org/geo/1.0/direct?q=\(city)&limit=5&appid=ff0b85475d4b79d53e234ac28d93f240"
    
    URLSession.shared.dataTask(with: URL(string: coordUrl)!, completionHandler: {data, response, error in
        guard let data = data, error == nil else {
            print("error")
            return
        }
        
        if let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [Any] {
            for item in json {
                if i <= 0{
                    if let object = item as? [String: Any] {
                        // ID
                        let londb = object["lon"] as? Double
                        
                        let latdb = object["lat"] as? Double
                        
                        lat = latdb!
                        lon = londb!
                        i += 1
                        
                        
                    }
                }
            }
            
        }
        
        print("im here")
        
        
    }).resume()
}
