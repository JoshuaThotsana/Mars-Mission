//
//  ServiceLayer.swift
//  Mars-Mission
//
//  Created by Thotsana Mabotsa on 2020/11/20.
//

import Foundation

protocol ServiceLayer {
	func fetchData(completion: @escaping (Result<SolKeys, WeatherError>) -> Void)
}
