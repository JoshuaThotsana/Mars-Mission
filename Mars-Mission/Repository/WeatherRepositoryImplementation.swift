//
//  WeatherRepositoryImplementation.swift
//  Mars-Mission
//
//  Created by Thotsana Mabotsa on 2020/11/20.
//

import Foundation

class WeatherRepositoryImplementation: WeatherRepository {
	
	let service: ServiceLayer
	
	init(service: ServiceLayer) {
		self.service = service
	}
	
	func fetchData(completion: @escaping (Result<SolKeys, Error>) -> Void) {
		service.fetchData { (result) in
			switch result {
			case .success(let weather):
				completion(.success(weather))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
}
