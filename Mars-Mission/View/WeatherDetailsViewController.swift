//
//  WeatherDetailsViewController.swift
//  Mars-Mission
//
//  Created by Thotsana Mabotsa on 2020/11/23.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
	
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var tempLabel: UILabel!
	@IBOutlet weak var humidityLabel: UILabel!
	@IBOutlet weak var windSpeedLabel: UILabel!
	@IBOutlet weak var safeLabel: UILabel!
	
	var date = ""
	var temp = ""
	var humidity = ""
	var windSpeed = ""
	var safe = ""

	
    override func viewDidLoad() {
        super.viewDidLoad()
		dateLabel.text = date
		tempLabel.text = temp
		humidityLabel.text = humidity
		windSpeedLabel.text = windSpeed
		safeLabel.text = safe
    }
	
	func commonInit(date: String, temp: String, humidity: String, windSpeed: String, safe: String) {
		self.date = date
		self.temp = temp
		self.humidity = humidity
		self.windSpeed = windSpeed
		self.safe = safe
	}
	
}
