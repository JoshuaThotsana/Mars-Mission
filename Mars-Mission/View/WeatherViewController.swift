//
//  WeatherViewController.swift
//  Mars-Mission
//
//  Created by Thotsana Mabotsa on 2020/11/23.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, WeatherView {
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	private lazy var viewModel = WeatherViewModel(view: self)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel.fetchForecast()
		
		tableView.dataSource = self
		tableView.delegate = self
		let nibName = UINib(nibName: "TableViewCell", bundle: nil)
		tableView.register(nibName, forCellReuseIdentifier: "tableViewCell")
		view.backgroundColor = .blue
		navigationItem.title = "NASA Weather"
	}
	
	func showLoadingIndicator() {
		self.activityIndicator.startAnimating()
		self.activityIndicator.isHidden = false
	}
	
	func hideLoadingIndicator() {
		self.activityIndicator.stopAnimating()
		self.activityIndicator.isHidden = true
	}
	
	func reloadWeatherTableView() {
		self.tableView.reloadData()
	}
	func showServerError() {
		let alert = UIAlertController(title: "Oops..!", message: "It looks like the server is not reachable,\nplease try again later.", preferredStyle: UIAlertController.Style.alert)
		self.present(alert, animated: true, completion: nil)
		alert.addAction(UIAlertAction(title: "Dismis", style: .cancel, handler: {_ in 
			self.hideLoadingIndicator()
		}))
		alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: {_ in
			self.viewModel.fetchForecast()
		}))

	}
	
	
	
}

extension WeatherViewController {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		viewModel.forecastDetails?.count ?? 0
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
		cell.commonInit(date: "\(String(describing: viewModel.forecastDetails?[indexPath.row].date ?? ""))")
		return cell
	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		86
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = WeatherDetailsViewController()
		vc.commonInit(date: "date: \(viewModel.forecastDetails?[indexPath.row].date ?? "")",
					  temp: "temp: \(viewModel.forecastDetails?[indexPath.row].temp ?? 0) ℃",
					  humidity: " humidity: \(viewModel.forecastDetails?[indexPath.row].humidity ?? 0) ％",
					  windSpeed: "humidity: \(viewModel.forecastDetails?[indexPath.row].windSpeed ?? 0) km/h",
					  safe: "safe: \(viewModel.forecastDetails?[indexPath.row].safe ?? false)")
		self.navigationController?.pushViewController(vc, animated: true)
		self.tableView.deselectRow(at: indexPath, animated: true)
	}
	
}
