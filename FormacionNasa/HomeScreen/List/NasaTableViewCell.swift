//
//  NasaTableViewCell.swift
//  FormacionNasa
//
//  Created by Ruben Higueras Galan on 22/10/2020.
//  Copyright © 2020 Ruben Higueras Galan. All rights reserved.
//

import UIKit

class NasaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = "test"
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
