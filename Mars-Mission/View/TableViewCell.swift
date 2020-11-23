//
//  TableViewCell.swift
//  Mars-Mission
//
//  Created by Thotsana Mabotsa on 2020/11/23.
//

import UIKit

class TableViewCell: UITableViewCell {
	
	@IBOutlet weak var dateLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func commonInit(date: String) {
		dateLabel.text = date
	}
    
}
