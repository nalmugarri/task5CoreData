//
//  TableViewCell.swift
//  task5CoreData
//
//  Created by Noura Khaled on 19/12/2018.
//  Copyright © 2018 Noura Almugarri. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cell: UIView!
    
    @IBOutlet weak var SNameLabel: UILabel!
    
    @IBOutlet weak var studentAgeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
