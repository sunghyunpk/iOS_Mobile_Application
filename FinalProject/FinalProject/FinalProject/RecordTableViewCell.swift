//  RecordTableViewCell.swift
//  FinalProject
//  Team member : Sunghyun Park(shpark92@iu.edu), Jae Kwan Kim(jk216@iu.edu), Tae Yoon Choi(choitae@iu.edu)
//  iOS App's name: COVID19 case finder
//  Submission Date: 05/06/2020
//
//  Created by Kim, Jae Kwan on 4/30/20.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//

import UIKit

class RecordTableViewCell: UITableViewCell {
    

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var caseLabel: UILabel!
    
    // changing input history label's text
    func countryRows(input:String){
        self.countryLabel.text = input
    }
    
    // changing output history label's text
    func caseRows(input:Int){
        self.caseLabel.text = String(input)
    }
 
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
