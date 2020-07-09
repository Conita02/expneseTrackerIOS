//
//  ExpenseTableViewController.swift
//  expenseM4
//
//  Created by weetbix on 26/3/19.
//  Copyright © 2019 Connor Brunjes. All rights reserved.
//

import UIKit
import os.log

class ExpenseTableViewController: UITableViewController {
    
    var expenses = ExpenseHolder()
    //MARK: Private Functions
    private func loadSamples() {
        
        guard let expense1 = Expense.init(cat: "Education", desc: "Books", amt: 50) else {fatalError("failed to load instance1")
        }
        
        guard let expense2 = Expense.init(cat: "Shopping", desc: "Bread", amt: 3.50) else {fatalError("failed to load instance2")}
        
        guard let expense3 = Expense.init(cat: "Entertainment", desc: "Movie", amt: 30) else {
            fatalError("failed to load instance3")
        }
        
        expenses.rec += [expense1, expense2, expense3]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        loadSamples()
        tableView.reloadData()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //3 sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return expenses.rec.count
        } else if section == 1 {
            return expenses.catTotal(array: expenses.rec).count
            
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Items"
        } else if section == 1 {
            return "Category Totals"
        } else {
            return "Overall"
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellIdentifier = "ExpenseTableViewCell"
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ExpenseTableViewCell else {fatalError("not an instance of ExpenseTableViewCell")}
            
            //selecting expense
            let expense = expenses.rec[indexPath.row]
            
            //config cell
            cell.catLabel.text = "(\(expense.cat))"
            cell.descLabel.text = expense.desc
            cell.amtLabel.text = String(expense.amt)
            
            return cell
            
        case 1:
            let cellIdentifier = "CatTotalCell"
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CatViewCell else {fatalError("not an instance of CatViewCell")}
            
            //calculating cat totals
            //print(expenses.catTotal(array: expenses.rec).count)
            let totals = expenses.catTotal(array: expenses.rec)[indexPath.row]
            
            //config cell
            let catTotal = totals
            
            cell.catAmt.text = String(catTotal.1)
            cell.catName.text = catTotal.0
            
            return cell
            
        case 2:
            let cellIdentifier = "OverallTotalCell"
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? OverallTableViewCell else {fatalError("not an instance of CatViewCell")}
            
            //calculating cat totals
            let total = expenses.allTotal(array: expenses.rec)
            
            //config cell
            cell.ovaAmt.text = String(total)
            cell.ovaLabel.text = "Total"
            
            return cell
            
        default:
            fatalError("no index found")
        }
        
    }
 
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return true
        } else {
            return false
        }
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            expenses.rec.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch (segue.identifier ?? "") {
        case "addItem":
            break
        case "showDetail":
            guard let expenseDetailViewController = segue.destination as? ExpenseViewController else{fatalError("Unknown destination: \(segue.destination)")}
            
            guard let selectedExpenseCell = sender as? ExpenseTableViewCell else {fatalError("unexpected sender: \(sender ?? "")")}
            
            guard let indexPath = tableView.indexPath(for: selectedExpenseCell) else {fatalError("did not find cell in table")}
            
            let selectedExpense = expenses.rec[indexPath.row]
            
            expenseDetailViewController.expense = selectedExpense
            
        default:
            fatalError("unknown segue identifier")
            
        }
        
    }
 
    //MARK: Actions
    @IBAction func unwindToExpenseList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? ExpenseViewController, let expense = sourceViewController.expense {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                expenses.rec[selectedIndexPath.row] = expense
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                // add the new expense to the view
                let newIndexPath = IndexPath(row: expenses.rec.count, section: 0)
                expenses.rec.append(expense)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
                tableView.reloadData()
            }
        }
    }
}
