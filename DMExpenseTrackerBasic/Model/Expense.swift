//
//  Expense.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/27/23.
//

import Foundation


struct Expense {
    var title: String
    var category: String
    var amount: Double

    static func calculateTotalSpent(expenses: [Expense]) -> Double {
        return expenses.reduce(0.0) { $0 + $1.amount } // no longer needed -> //0 Just for now
    }

    static func getExpensesByCategory(expenses: [Expense]) -> [String : [Expense]] {
        var expensesByCategory: [String: [Expense]] = [:]

            for expense in expenses {
                if var categoryExpenses = expensesByCategory[expense.category] {
                    categoryExpenses.append(expense)
                    expensesByCategory[expense.category] = categoryExpenses
            } else {
                expensesByCategory[expense.category] = [expense]
            }
        }

        return expensesByCategory
    }
}
