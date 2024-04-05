//
//  CategoriesViewController.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/27/23.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var expenses = DataController.getExpenses()
    var expensesByCategory: [String: [Expense]] = [:] //Where does Expense come from???
    
    func initializeExpenseData() {
        
    }
    
    func configureTableView() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
