//
//  expenseM4Tests.swift
//  expenseM4Tests
//
//  Created by weetbix on 24/3/19.
//  Copyright © 2019 Connor Brunjes. All rights reserved.
//

import XCTest
@testable import expenseM4

class expenseM4Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let test = Expense.init(cat: "Education", desc: "Books", amt: 30)
        let test1 = Expense.init(cat: "Shopping", desc: "Lettuce", amt: 7)
        let test2 = Expense.init(cat: "Entertainment", desc: "Movies", amt: 28)
        let expenses = ExpenseHolder()
        expenses.rec.append(test!)
        expenses.rec.append(test1!)
        expenses.rec.append(test2!)
        XCTAssert(test?.amt == 30)
        XCTAssert(test?.cat == "Education")
        XCTAssert(test?.desc == "Books")
        XCTAssert(expenses.allTotal(array: expenses.rec) == 65)
        XCTAssert(expenses.catTotal(array: expenses.rec).count == 3)
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
