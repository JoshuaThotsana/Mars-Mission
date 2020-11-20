//
//  WeatherViewController.swift
//  Mars-Mission
//
//  Created by Thotsana Mabotsa on 2020/11/20.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, WeatherView {
	func reloadWeatherTableView() {
		self.tableView.reloadData()
	}
	
	@IBOutlet weak var tableView: UITableView!
	
	let repository = WeatherRepositoryImplementation(service: ServiceLayerImplementation())
	
	private lazy var viewModel = WeatherViewModel(view: self, repository: repository) 
		
    override func viewDidLoad() {
        super.viewDidLoad()
		viewModel.fetchData()
		tableView.dataSource = self
		tableView.delegate = self
		let nibName = UINib(nibName: "TableViewCell", bundle: nil)
		tableView.register(nibName, forCellReuseIdentifier: "tableViewCell")
		view.backgroundColor = .blue
		navigationItem.title = "NASA Weather"
    }
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.weather?.solKeys.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
		as! TableViewCell
		cell.commonInit(dateString: "\(String(describing: viewModel.weather?.solKeys[indexPath.row] ?? ""))")
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = WeatherDetailsViewController(nibName: "WeatherDetailsViewController", bundle: nil)
		vc.solNumber = "\(String(describing: viewModel.weather?.solKeys[indexPath.row] ?? ""))"
		self.navigationController?.pushViewController(vc, animated: true)
	}
}



