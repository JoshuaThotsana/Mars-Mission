//
//  WeatherDeatailsViewController.swift
//  Mars-Mission
//
//  Created by Thotsana Mabotsa on 2020/11/20.
//

import UIKit

class WeatherDetailsViewController: UIViewController {

	@IBOutlet weak var solNumberLabel: UILabel!
	
	var solNumber = String()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		solNumberLabel.text = "Sol number is: \(solNumber)"
    }
	
	func commonInit(solNumber: String) {
		self.solNumber = solNumber
	}

}
