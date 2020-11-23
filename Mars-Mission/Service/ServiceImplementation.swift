//
//  ServiceImplementation.swift
//  Mars-Mission
//
//  Created by Thotsana Mabotsa on 2020/11/23.
//

import Foundation

enum ForecastError: Error {
	case noDataAvailable
	case canNotProcessData
}

struct ServiceImplementation: Service {
	
	let resourceURL: URL
	
	init() {
		let resourceString = "https://run.mocky.io/v3/04dc1be1-8609-48c9-b4a0-27a363aa22a9"
		
		guard let resourceURL = URL(string: resourceString) else { fatalError() }
		self.resourceURL = resourceURL
	}
	
	
	func getForecast(completion: @escaping (Result<[ForecastDetails], ForecastError>) -> Void) {
		let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, response, error in
			guard let jsonData = data else {
				completion(.failure(.noDataAvailable))
				return
			}
			
			do {
				let decoder = JSONDecoder()
				let responseObject = try decoder.decode(Forecasts.self, from: jsonData)
				let forecastDetails = responseObject.forecasts
				completion(.success(forecastDetails))
				print(forecastDetails)
			} catch {
				completion(.failure(.canNotProcessData))
			}
		}
		
		dataTask.resume()
	}
	
}
