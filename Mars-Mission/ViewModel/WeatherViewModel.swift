//
//  WeatherViewModel.swift
//  Mars-Mission
//
//  Created by Thotsana Mabotsa on 2020/11/23.
//

import Foundation

class WeatherViewModel {
	
	let repository = APICallServiceRepositoryImplementation()
	
	var view: WeatherViewController
	var forecastDetails: [ForecastDetails]?
	
	init(view: WeatherViewController) {
		self.view = view
	}
	
	func fetchForecast() {
		self.view.showLoadingIndicator()
		DispatchQueue.global(qos: .background).async {
			self.repository.getForecast { (result) in
				switch result {
				case .success(let forecast):
					self.handleFetchForecastSucceeds(forecast)
				case .failure(let error):
					self.handleFetchForecastFails(error)
				}
			}
		}
	}
	
	private func handleFetchForecastSucceeds(_ forecastDetails: [ForecastDetails]) {
		DispatchQueue.main.async {
			self.forecastDetails = forecastDetails
			self.view.reloadWeatherTableView()
			self.view.hideLoadingIndicator()
		}
	}
	
	private func handleFetchForecastFails(_ error: Error) {
		DispatchQueue.main.async {
			self.view.showServerError()
		}
	}
}



