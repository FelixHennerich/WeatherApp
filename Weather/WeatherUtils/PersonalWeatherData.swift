//
//  PersonalWeatherData.swift
//  Weather
//
//  Created by Felix Hennerich on 26.02.23.
//

import Foundation
import UIKit

let url = URL(string: "https://cross-cultural-auto.000webhostapp.com/DataInsert.php")!

func getHTTP(){
    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        guard let data = data else { return }
        print(String(data: data, encoding: .utf8)!)
    }

    task.resume()
}
