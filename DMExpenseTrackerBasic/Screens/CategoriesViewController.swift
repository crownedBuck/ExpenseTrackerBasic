//
//  CategoriesViewController.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/27/23.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var expenses = DataController.getExpenses()
    var expensesByCategory: [String: [Expense]] = [ : ]
    var categories: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesLabel.text = "Categories"
//        print("----")
//        print("initializeExpenseData() started running")
        initializeExpenseData()
//        print("----")
//        print("configureTableView() started running")
//        print("----")
        configureTableView()
    }
        
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.reloadData()
//        print("configureTableView() is done running")
    }
    
    func initializeExpenseData() {
            
        expensesByCategory = Expense.getExpensesByCategory(expenses: expenses)
            
        for category in expensesByCategory {
                categories.append(category.key)
        }
            
//        print(categories) // Test to make sure that each category is being appended properly
//        
//        print("initializeExpenseData() is done running")
            
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("categories counted")
//        print(categories.count)
        return categories.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath)
            
        let categoryNames = categories[indexPath.row]
            
        var config = cell.defaultContentConfiguration()
        config.text = categoryNames
            
//        print("this was triggered")
            
        cell.contentConfiguration = config
            
        return cell
    }
    
    
    @IBSegueAction func sendCategoryController(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> ExpensesViewController? {
        
        let index = tableView.indexPathForSelectedRow?.row
        
        let selectedCategory = categories[index!]
        
        let sendCategory = ExpensesViewController(
            coder: coder,
            category: selectedCategory,
            expenses: expensesByCategory[selectedCategory]!
        )
        
//        print(coder)
//        print(selectedCategory)
//        print(expensesByCategory[selectedCategory]!)
//        print(sendCategory!)
        
        return sendCategory!
    }
            
}
