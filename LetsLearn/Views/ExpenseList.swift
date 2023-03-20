//
//  ExpenseList.swift
//  LetsLearn
//
//  Created by user232479 on 3/15/23.
//

import SwiftUI

struct ExpenseList: View {
    @State private var showPaidOnly = false
    @EnvironmentObject var expenseData: ExpenseData
    var filteredExpenses: [Expense]{
        expenseData.dataExpenses.filter{ expense in
            (!showPaidOnly || expense.isExpensePaid )
        }
    }
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemMint]
    }
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.black.ignoresSafeArea().opacity(0.80)
                VStack{
                    
                    Toggle("    Filter paid expenses", isOn: $showPaidOnly)
                        .background(Color.black.opacity(0.50))
                        .foregroundColor(Color.white)
                        .toggleStyle(.switch)
                        .tint(Color.mint)
                    List{
                        
                        ForEach(filteredExpenses){expense in
                            NavigationLink{
                                ExpenseDetail(expense: expense)
                            } label: {
                                ExpenseRow(expense: expense)
                                    .buttonStyle(.plain)
                            }
                        }
                        .onDelete(perform: delete)
                        .listRowBackground(Color.mint)
                        .navigationTitle("Expenses")
                    }
                    .listStyle(.plain)
                    .listRowBackground(Color.mint)
                }
                .toolbar{
                    NavigationLink(destination: AddExpense()) {
                        Text("Add Expense").foregroundColor(Color.mint)
                    }
                    EditButton().foregroundColor(Color.mint)
                }
            }
            
        }
    }
    func delete(at Offset: IndexSet){
        expenseData.dataExpenses.remove(atOffsets: Offset)
        save(expenses: expenseData.dataExpenses)
    }
}

struct ExpenseList_Previews: PreviewProvider {
    static let expenseData = ExpenseData()
    static var previews: some View {
        ExpenseList()
            .environmentObject(expenseData)
    }
}
