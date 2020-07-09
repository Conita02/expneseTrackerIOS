//
//  ViewController.swift
//  expenseM4
//
//  Created by weetbix on 24/3/19.
//  Copyright © 2019 Connor Brunjes. All rights reserved.
//

import UIKit
import os.log

class ExpenseViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    @IBOutlet weak var catSeg: UISegmentedControl!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var amtField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var expense: Expense?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //handle user input through delegate
        descField.delegate = self
        amtField.delegate = self
        //updateSaveButtonState()
        
        //create edit expense
        if let expense = expense {
            //populate fields
            amtField.text = String(expense.amt)
            descField.text = expense.desc
            var count = catSeg.numberOfSegments
            count = count - 1
            let title = expense.cat
            while count > -1 {
                guard let segTitle = catSeg.titleForSegment(at: count) else { fatalError("no segments found")}
                if title == segTitle{
                    catSeg.selectedSegmentIndex = count
                    break
                }
                count = count - 1
            }
        }
    }
    
    //MARK: TextField
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = descField.text
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        descField.resignFirstResponder()
        amtField.resignFirstResponder()
        return true
    }
    

    //MARK: Nav
    //prepare item view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {fatalError("save was no pressed")
        
        }
        //object value definition
        let cat = catSeg.selectedSegmentIndex
        let catTitle = catSeg.titleForSegment(at: cat)
        guard let desc = descField.text else {fatalError("no value for desc found canceling")}
        guard let amt = amtField.text else {fatalError("no value for amt found canceling")}
        
        //object to be passed to item view
        expense = Expense.init(cat: catTitle ?? "", desc: desc, amt: Double(amt) ?? 10)
        
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        //depending on presenting view controller cancel differently
        let presentingInAdd = presentingViewController is UINavigationController
        
        if presentingInAdd {
            dismiss(animated: true, completion: nil)
        } else if let owningNavagationController = navigationController {
            owningNavagationController.popViewController(animated: true)
        } else {
            fatalError("where you from?")
        }
        
    }
    
    //MARK: Private Methods
    private func updateSaveButtonState() {
        let text1 = descField.text ?? ""
        let text2 = amtField.text ?? ""
        saveButton.isEnabled = !text1.isEmpty && !text2.isEmpty
    }

}

