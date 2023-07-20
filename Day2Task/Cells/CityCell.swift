//
//  CityCell.swift
//  Day2Task
//
//  Created by Saltuk Bugra OZELGUL on 19.07.2023.
//

import UIKit

class CityCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.textLabel?.textColor = .red
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
