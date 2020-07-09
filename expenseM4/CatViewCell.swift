//
//  CatViewCell.swift
//  expenseM4
//
//  Created by weetbix on 2/4/19.
//  Copyright © 2019 Connor Brunjes. All rights reserved.
//

import UIKit

class CatViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var catName: UILabel!
    @IBOutlet weak var catAmt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
