//
//  WeatherIcons.swift
//  Weather
//
//  Created by Felix Hennerich on 12.01.23.
//

import Foundation
import SwiftUI

/**
 Get system Image by iconid
 */

public func getImage(iconId: String) -> Image {
    var img: Image
    var imgname: String = ""
    
    if(iconId == "01d"){
        imgname = "sun.max.fill"
    }else if(iconId == "02d"){
        imgname = "cloud.sun.fill"
    }else if(iconId == "02n"){
        imgname = "cloud.moon.fill"
    }else if(iconId == "03d" || iconId == "03n"){
        imgname = "cloud.fill"
    }else if(iconId == "04d" || iconId == "04n"){
        imgname = "cloud.fill"
    }else if(iconId == "09d" || iconId == "09n"){
        imgname = "cloud.rain.fill"
    }else if(iconId == "10d" || iconId == "10n"){
        imgname = "cloud.drizzle.fill"
    }else if(iconId == "11d" || iconId == "11n"){
        imgname = "cloud.bolt.rain.fill"
    }else if(iconId == "13d" || iconId == "13n"){
        imgname = "snowflake"
    }else if(iconId == "50d" || iconId == "50n"){
        imgname = "smoke.fill"
    }else if(iconId == "01n"){
        imgname = "moon.fill"
    }else{
        imgname = "square.and.arrow.up.trianglebadge.exclamationmark"
    }
    
    img = Image(systemName: imgname)
    return img
}
