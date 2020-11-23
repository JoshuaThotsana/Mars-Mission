//
//  Service.swift
//  Mars-Mission
//
//  Created by Thotsana Mabotsa on 2020/11/23.
//

import Foundation

protocol Service {
	func getForecast(completion: @escaping (Result<[ForecastDetails], ForecastError>) -> Void)
}
