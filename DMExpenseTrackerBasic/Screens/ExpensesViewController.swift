//
//  ExpensesViewController.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/28/23.
//

import UIKit

class ExpensesViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var spentLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var category: String = ""
    var expenses: [Expense] = []
    
    func configureViewController() {
        let spent = Expense.calculateTotalSpent(expenses: expenses)
        spentLabel.text = "You spent $\(spent) on \(category)"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(expenses.count)
        return expenses.count // just for now so xcode stops screaming at me
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("this is called")
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryExpenses", for: indexPath) as! ExpenseCell
        let expense = expenses[indexPath.row]
        
        cell.titleLabel?.text = expense.title
        cell.paymentLabel?.text = "\(expense.amount)"
        
//        let name = expenses[indexPath.row].title
//        var config = cell.defaultContentConfiguration()
//        config.text = name
//        cell.contentConfiguration = config
        
        return cell
    }
    
    init?(coder: NSCoder, category: String, expenses: [Expense]){
        self.category = category
        self.expenses = expenses
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ExpenseCell {
    
}
