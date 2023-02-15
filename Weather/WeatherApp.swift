//
//  WeatherApp.swift
//  Weather
//
//  Created by Felix Hennerich on 08.01.23.
//

import SwiftUI

//API Key: ff0b85475d4b79d53e234ac28d93f240

//Coordinates: 48.21318441976442, 9.030872305354816

/*
 Link:
 https://api.openweathermap.org/data/3.0/onecall?lat=48.21318441976442&lon=9.030872305354816&exclude=current,minutely,hourly,daily&appid=ff0b85475d4b79d53e234ac28d93f240
 
 https://api.openweathermap.org/data/2.5/weather?lat=48.21318441976442&lon=9.030872305354816&appid=ff0b85475d4b79d53e234ac28d93f240
 
 */

@main
struct WeatherApp: App {
    
    init(){
        getData()
        print("    Test 1 passed √")
        CheckBackground()
        print("    Test 2 passed √")
        sleep(2)
        print("    Test 3 passed √")
        
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
/**
 Check the time for Night- and Daymode
 */
private func CheckBackground() {
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    if(hour < 20 && hour > 8){
        isNight = false
    }else {
        isNight = true
    }
}

/**
 Method to get the screenWidth in pixels
 */
public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

/**
 Method to get the screenHeight in pixels
 */

public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}

