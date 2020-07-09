//
//  ExpenseHolder.swift
//  expenseM4Tests
//
//  Created by weetbix on 29/3/19.
//  Copyright © 2019 Connor Brunjes. All rights reserved.
//

import Foundation
/**
 Store array of Expense objects in this class
 - SeeAlso: class Expense
 */
public class ExpenseHolder {
    ///Stores **Expense** objects in an array
    ///useful for computation methods applied in this class
    var rec = [Expense]()
    /**
    calculate the total of the var rec
    - Parameter array: rec is used as array parameter
    - Returns: double equal to total of all Expenses
     */
    func allTotal(array: Array<Any>) -> Double {
        var total: Double = 0
        for i in rec {
            let objHand = i
            let amt = objHand.amt
            total = total + amt
        }
        return total
    }
    
    /**
     calculate the total of the var rec
     - Parameter array: rec is used as array parameter
     - Returns: array of tuples equal to current cat totals
     */
    func catTotal(array: Array<Any>) -> [(String, Double)] {
        var totalsDict = [String:[Double]]()
        totalsDict = ["Shopping": [0], "Education": [0], "Entertainment": [0]]
        var totalsFinal = [(String, Double)]()
        
        for i in rec {
            totalsDict[i.cat]?.append(i.amt)
        }
        
        for i in totalsDict {
            var total:Double = 0
            if i.key == i.key {
                for i in i.value {
                    total = total + i
                }
                totalsFinal.append((i.key, total))
            }
        }
        return totalsFinal
    }
}


