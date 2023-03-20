//
//  ExpenseDetail.swift
//  LetsLearn
//
//  Created by user232479 on 3/15/23.
//

import SwiftUI

struct ExpenseDetail: View {
    @EnvironmentObject var expenseData: ExpenseData
    var expense: Expense
    //@State var tempisPaid = expense.isExpensePaid
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.black.opacity(0.8).ignoresSafeArea()
                ZStack{
                    
                    VStack(alignment: .leading){
                        if(expense.isImage == true){
                            Image("fake_receipt")
                                .resizable()
                                .frame(width: 400, height: 425)
                            ZStack{
                                Color.black.opacity(0.8)
                                VStack{
                                    Text("Expense Name: \(expense.expenseName)").frame(width: 380, height: 30, alignment: .leading).background(.mint)
                                    Text(String("Expense Price \(expense.exepnsePrice)")).frame(width: 380, height: 30, alignment: .leading).background(.mint)
                                    Text(String("Is Expense Paid? \(expense.isExpensePaid)")).frame(width: 380, height: 30, alignment: .leading).background(.mint)
                                    Text(String("Is Vat Added? \(expense.isVat)")).frame(width: 380, height: 30, alignment: .leading).background(.mint)
                                    Text(String("Date Expense Added \(expense.dateAdded.formatted())")).frame(width: 380, height: 30, alignment: .leading).background(.mint)
                                    Text(String("Date Receipt was incurred \(expense.dateOfRecipt.formatted())")).frame(width: 380, height: 30, alignment: .leading).background(.mint)
                                    if(expense.isExpensePaid){
                                        Text(String("Date Recipt was Paid: \(expense.dateOfPayment.formatted())")).frame(width: 380, height: 30, alignment: .leading).background(.mint)
                                    }
                                    else{
                                        Text(String("Date Recipt was Paid? Expense yet to be paid")).frame(width: 380, height: 30, alignment: .leading).background(.mint)
                                    }
                                }
                            }
                            
                        }
                        else{
                            ZStack{
                                Color.black.opacity(0.8)
                                VStack{
                                    Text("Expense Name: \(expense.expenseName)").frame(width: 380, height: 30, alignment: .leading).background(.mint)
                                    Text(String("Expense Price \(expense.exepnsePrice)")).frame(width: 380, height: 30, alignment: .leading).background(.mint)
                                    Text(String("Is Expense Paid? \(expense.isExpensePaid)")).frame(width: 380, height: 30, alignment: .leading).background(.mint)
                                    Text(String("Is Vat Added? \(expense.isVat)")).frame(width: 380, height: 30, alignment: .leading).background(.mint)
                                    Text(String("Date Expense Added \(expense.dateAdded.formatted())")).frame(width: 380, height: 30, alignment: .leading).background(.mint)
                                    Text(String("Date Receipt was incurred \(expense.dateOfRecipt.formatted())")).frame(width: 380, height: 30, alignment: .leading).background(.mint)
                                    Text(String("Date Recipt was Paid")).frame(width: 380, height: 30, alignment: .leading).background(.mint)
                                    
                                }
                            }
                        }
                        
                        
                    }
                }
            }
        }.navigationTitle("Expense Detail")
    }
}

struct ExpenseDetail_Previews: PreviewProvider {
    static let dataExpense = ExpenseData()
    static let expense = dataExpense.dataExpenses
    static var previews: some View {
        
        ExpenseDetail(expense:dataExpense.dataExpenses[0])
            .environmentObject(dataExpense)
    }
}

