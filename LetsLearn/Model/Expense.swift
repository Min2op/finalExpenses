//
//  Expense.swift
//  LetsLearn
//
//  Created by user232479 on 3/13/23.
//

import Foundation



struct Expense : Hashable, Codable, Identifiable{
    var id: Int
    var expenseName: String
    var expenseDescription: String
    var exepnsePrice: Double
    var isExpensePaid: Bool
    var dateAdded: Date
    var dateOfRecipt: Date
    var dateOfPayment: Date
    var isVat: Bool
    var isImage: Bool
}





