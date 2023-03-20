//
//  Expenses.swift
//  LetsLearn
//
//  Created by user232479 on 3/13/23.
//

import Foundation
import Combine

let exampleExpense: Expense = Expense(id: 0000, expenseName: "Example Name", expenseDescription: "Example Description", exepnsePrice: 100, isExpensePaid: false, dateAdded: Date.now, dateOfRecipt: Date.now, dateOfPayment: Date.now, isVat: false, isImage: true)

var expenses: [Expense] = []

final class ExpenseData: ObservableObject{
    @Published var dataExpenses: [Expense] = load()
}

func fileURL()-> URL {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask) //Access the documents direcorty and looks at all the paths
    return path[0] //returns the first file path in the document Directory
}


func load() -> [Expense] {
    
    let decoder = JSONDecoder()
    let url = fileURL().appendingPathComponent("data.JSON")
    do{
        let data = try? Data(contentsOf: url)
        expenses = try! decoder.decode([Expense].self, from: data!)
    }catch{
        print(error)
    }
    return expenses
}

func save(expenses: [Expense]){
    let encoder = JSONEncoder()
    do{
        let data = try encoder.encode(expenses)
        let url = fileURL().appendingPathComponent("data.JSON")
        try data.write(to: url)
        
    }catch{
        print(error)
    }
    
}

func addExpense(newExpense: Expense, modelData: ExpenseData){
    modelData.dataExpenses.append(newExpense)
    save(expenses: modelData.dataExpenses)
    //load()
}

func clearFolder(){
    do{
        try FileManager.default.removeItem(at: fileURL().appendingPathComponent("data.JSON"))
    }catch{
        print(error)
    }
}

