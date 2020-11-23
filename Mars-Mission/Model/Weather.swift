//
//  Weather.swift
//  Mars-Mission
//
//  Created by Thotsana Mabotsa on 2020/11/17.
//

import Foundation

// MARK: - WeatherDetails
struct Forecasts: Decodable {
	let forecasts: [ForecastDetails]
	let lastUpdated, weatherStation: String
}

// MARK: - Forecast
struct ForecastDetails: Decodable {
	let date: String
	let temp, humidity, windSpeed: Int
	let safe: Bool
}
