//
//  Weather.swift
//  HeadsHands
//
//  Created by Захар Бабкин on 07/02/2019.
//  Copyright © 2019 Захар Бабкин. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let coord: Coord?
    let weather: [_Weather]?
    let base: String?
    let main: Main
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let id: Int?
    let name: String?
    let cod: Int?
}

struct Clouds: Codable {
    let all: Int?
}

struct Coord: Codable {
    let lon, lat: Double?
}

struct Main: Codable {
    let temp, pressure: Double
    let humidity: Int?
    let tempMin, tempMax, seaLevel, grndLevel: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

struct Sys: Codable {
    let message: Double?
    let country: String?
    let sunrise, sunset: Int?
}

struct _Weather: Codable {
    let id: Int?
    let main, description, icon: String?
}

struct Wind: Codable {
    let speed, deg: Double?
}
