//
//  ExpenseCell.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/28/23.
//

import UIKit

class ExpenseCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var paymentLabel: UILabel!
    
    
    func set(expense: Expense) {
        print("cell is called")
        titleLabel.text = expense.title
        paymentLabel.text = "\(expense.amount)"
    }
    
}
