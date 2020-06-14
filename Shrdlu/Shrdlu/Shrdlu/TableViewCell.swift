//
//  TableViewCell.swift
//  Shrdlu
//
//  Created by Park, Sunghyun on 3/12/20.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var computer: UILabel!
    @IBOutlet weak var person: UILabel!
    
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
