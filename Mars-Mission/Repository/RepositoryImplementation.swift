//
//  RepositoryImplementation.swift
//  Mars-Mission
//
//  Created by Thotsana Mabotsa on 2020/11/23.
//

import Foundation

class RepositoryImplementation: Repository {
	
	private let service = ServiceImplementation()
	
	func getForecast(completion: @escaping (Result<[ForecastDetails], ForecastError>) -> Void) {
		service.getForecast { (result) in
			switch result {
			case .success(let forecast):
				completion(.success(forecast))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
	
}
