//
//  ExpenseRow.swift
//  LetsLearn
//
//  Created by user232479 on 3/15/23.
//

import SwiftUI

struct ExpenseRow: View {
    @EnvironmentObject var expenseData: ExpenseData
    var expense: Expense
    var expenseIndex: Int{
        expenseData.dataExpenses.firstIndex(where: { $0.id == expense.id}) ?? 0
    }
    
    var body: some View {
        ZStack{
            HStack{
                VStack(alignment: .leading){
                    Text(expense.expenseName)
                    
                    HStack{
                        Text("is Paid?")
                        PaidButton(isSet: $expenseData.dataExpenses[expenseIndex].isExpensePaid).onChange(of: expense.isExpensePaid){dat in
                            save(expenses: expenseData.dataExpenses)
                        }
                        
                        
                    }
                    
                    if expenseData.dataExpenses[expenseIndex] .isExpensePaid == true{
                        DatePicker(selection: $expenseData.dataExpenses[expenseIndex].dateOfPayment, in: ...Date.now, displayedComponents: .date ){
                            Text("Date of payment")
                            
                        }
                    }
                }
                
            }
        }
        //Text("Date of Recipt \(expense.dateOfRecipt.formatted())" )
    }
    
    func callSave(){
        print("hey")
    }
}


struct ExpenseRow_Previews: PreviewProvider {
    static let dataExpense = ExpenseData()
    static var expense = ExpenseData().dataExpenses
    static var previews: some View {
        ExpenseRow(expense: dataExpense.dataExpenses[0])
            .environmentObject(dataExpense)
    }
}
