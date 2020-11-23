//
//  WeatherView.swift
//  Mars-Mission
//
//  Created by Thotsana Mabotsa on 2020/11/23.
//

import Foundation

protocol WeatherView {
	func showLoadingIndicator()
	func hideLoadingIndicator()
	func showServerError() 
}
