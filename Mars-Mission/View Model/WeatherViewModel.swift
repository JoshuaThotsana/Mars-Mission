//
//  WeatherViewModel.swift
//  Mars-Mission
//
//  Created by Thotsana Mabotsa on 2020/11/20.
//

import Foundation

class WeatherViewModel {
	
	let repository: WeatherRepository
	
	var view: WeatherView
	var weather: SolKeys?
	
	init(view: WeatherView, repository: WeatherRepository) {
		self.view = view
		self.repository = repository
	}
	
	func fetchData() {
		DispatchQueue.global(qos: .background).async {
			self.repository.fetchData { (result) in
				switch result {
				case .success(let weather):
					self.handleThatFetchPostSucceeds(weather)
					print("\(weather.solKeys) this is the data needed")
				case .failure(let error):
					print(error)
				}
			}
		}
	}
	
	private func handleThatFetchPostSucceeds(_ weather: SolKeys) {
		DispatchQueue.main.async {
			self.weather = weather
			self.view.reloadWeatherTableView()
		}
	}
	
	private func handleThatFetchPostFial(_ weather: SolKeys) {
		DispatchQueue.main.async {
			
		}
	}
	
}



