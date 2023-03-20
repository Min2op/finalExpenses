//
//  LetsLearnApp.swift
//  LetsLearn
//
//  Created by user232479 on 3/13/23.
//

import SwiftUI

@main
struct LetsLearnApp: App {
    init(){
        //clearFolder() //uncoment this if you want a fresh list
        let exampleExpensed: Expense = Expense(id: 0000, expenseName: "Example Name", expenseDescription: "Example Description", exepnsePrice: 100, isExpensePaid: false, dateAdded: Date.now, dateOfRecipt: Date.now, dateOfPayment: Date.now, isVat: false, isImage: true)
        
        let path  = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String // setting path to first file in document directory.
        let url = NSURL(fileURLWithPath:  path) // converting the string to a URL
        if let pathComponent = url.appendingPathComponent("data.JSON") { //adding the file we want to use.
            let filePath = pathComponent.path 
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath) {
                print("FILE AVAILABLE")
                load()
                for i in expenses{
                    print(i.expenseName, i.exepnsePrice, i.dateAdded)
                }
            } else {
                print("NO FILE creating example expense")
                expenses.append(exampleExpensed)
                save(expenses: expenses)
            }
        } else {
            print("FILE PATH NOT AVAILABLE")
        }
        
        
    }
    
    
    @StateObject var expenseData = ExpenseData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(expenseData)
            
        }
    }
}


