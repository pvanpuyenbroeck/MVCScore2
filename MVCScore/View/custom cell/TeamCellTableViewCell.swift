//
//  TeamCellTableViewCell.swift
//  MVCScore
//
//  Created by Pieter on 1/12/17.
//  Copyright © 2017 The White Russians. All rights reserved.
//

import UIKit

class TeamCellTableViewCell: UITableViewCell {
    @IBOutlet weak var ImageCell: UIImageView!
    @IBOutlet weak var TeamNameCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
