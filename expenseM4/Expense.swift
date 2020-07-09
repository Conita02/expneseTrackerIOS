//
//  Expense.swift
//  expenseM4
//
//  Created by weetbix on 25/3/19.
//  Copyright © 2019 Connor Brunjes. All rights reserved.
//

import Foundation
///class used to initialise Expense Objects
public class Expense {
    ///category storage string
    var cat: String
    ///desc of item in category
    var desc: String
    ///value for that item stored as a var x:Double
    var amt: Double
    
    /**
     Expense Object Initialiser
     - Parameter cat: string for category value
     - Parameter desc: string for desc value
     - Parameter amt: Double value for price
     */
    init?(cat: String, desc: String, amt: Double) {
        //required values
        guard !cat.isEmpty else {
            return nil
        }
        guard !desc.isEmpty else {
            return nil
        }
        guard !amt.isNaN else {
            return nil
        }
        
        self.cat = cat
        self.desc = desc
        self.amt = amt
    }
    
}
