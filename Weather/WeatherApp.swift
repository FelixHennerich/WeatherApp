//
//  WeatherApp.swift
//  Weather
//
//  Created by Felix Hennerich on 08.01.23.
//

import SwiftUI

//API Key: cf3132ed19a74f78b2c28d4fc23785cc

//Coordinates: 48.21318441976442, 9.030872305354816

/*
 Link:
 https://api.openweathermap.org/data/3.0/onecall?lat=48.21318441976442&lon=9.030872305354816&exclude=current,minutely,hourly,daily&appid=cf3132ed19a74f78b2c28d4fc23785cc
 
 */

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
