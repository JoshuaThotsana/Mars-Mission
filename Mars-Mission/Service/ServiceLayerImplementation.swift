//
//  WeatherRequest.swift
//  Mars-Mission
//
//  Created by Thotsana Mabotsa on 2020/11/19.
//

import Foundation

enum WeatherError: Error {
	case noDataAvailable
	case canNotProcessData
}

class ServiceLayerImplementation: ServiceLayer {
	
	let resourceURL: URL
	let API_KEY = "w4ocSiscXz2o27yuHCgCrV07foqRD50BHciYNP4I"
	
	var solKeys: [String] = []
	
	init() {
		let resourceString = "https://api.nasa.gov/insight_weather/?api_key=\(API_KEY)&feedtype=json&ver=1.0"
		guard let resourceURL = URL(string: resourceString) else { fatalError() }
		self.resourceURL = resourceURL
	}
	
	func fetchData(completion: @escaping (Result<SolKeys, WeatherError>) -> Void) {
		let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, response, erro in
			guard let jsonData = data else {
				completion(.failure(.noDataAvailable))
				return
			}
			do {
				let decoder = JSONDecoder()
//				print("I'm here")
				let weatherResponse = try decoder.decode(SolKeys.self, from: jsonData)
				completion(.success(weatherResponse))
//				print(weatherResponse)
			} catch {
				completion(.failure(.canNotProcessData))
			}
		}
		dataTask.resume()		
	}
	
}
