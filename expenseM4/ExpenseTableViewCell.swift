//
//  ExpenseTableViewCell.swift
//  expenseM4
//
//  Created by weetbix on 24/3/19.
//  Copyright © 2019 Connor Brunjes. All rights reserved.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var catLabel: UILabel!
    @IBOutlet weak var amtLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
