//
//  AddExpense.swift
//  LetsLearn
//
//  Created by user232479 on 3/13/23.
//

import SwiftUI


struct AddExpense: View {
    @Environment(\.dismiss) var dismiss
    @State var tempexpenseName: String = ""
    @State var tempexpenseDescription: String = ""
    @State var tempexpensePrice: String = ""
    @State var tempDateOfRecipt: Date = Date.now
    @State var tempisVAT: Bool = false
    @EnvironmentObject var modelData: ExpenseData
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showImagePicker = false
    @State private var tisImage: Bool = false
    
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.black.ignoresSafeArea().opacity(100)
                VStack{
                    ZStack{
                        Color.gray
                        Rectangle().fill(.secondary)
                        
                        Text("Tap to add image to expense")
                            .foregroundColor(.white)
                            .font(.headline)
                        image?
                            .resizable()
                            .scaledToFit()
                            .frame()
                    }
                    .onTapGesture {
                        showImagePicker = true
                        //select image
                    }
                    ZStack{
                        Color.mint.ignoresSafeArea()
                        VStack{
                            TextField("Expense Name ", text: $tempexpenseName)
                            TextField("Expense Description ", text: $tempexpenseDescription)
                            TextField("200", text: $tempexpensePrice)
                            Toggle("Does the expense Include Vat? ", isOn: $tempisVAT).onChange(of: tempisVAT){ value in
                                if(tempisVAT){
                                    var x = (Double(tempexpensePrice) ?? 0) * 1.20
                                    
                                    var s = String(format: "%.2f", x)
                                    tempexpensePrice = s
                                }
                                else{
                                    var x = (Double(tempexpensePrice) ?? 0) / 120 * 100
                                    var s = String(format: "%.2f", x)
                                    tempexpensePrice = s
                                }
                                
                                
                                
                            }
                            DatePicker(selection: $tempDateOfRecipt, in: ...Date.now, displayedComponents: .date){
                                Text("Please put the date the Recipt was onccured")
                            }.padding(1)
                            let todayDate = Date.now
                            Text("Date added to app \(todayDate.formatted()) ").frame(width: 394, alignment: .leading).padding(1)
                            Text("Date of Payment:  Needs to be paid in main menu!").frame(width: 394, alignment: .leading)
                            
                            Spacer()
                            Button("Add Expense"){
                                let realTempPrice:Double? = Double(tempexpensePrice)
                                var newExpense: Expense = Expense(id: modelData.dataExpenses.count, expenseName: tempexpenseName, expenseDescription: tempexpenseDescription, exepnsePrice: realTempPrice!, isExpensePaid: false,  dateAdded: Date.now, dateOfRecipt: Date.now, dateOfPayment: Date.now,
                                                                  isVat: tempisVAT, isImage: tisImage )
                                addExpense(newExpense: newExpense, modelData: modelData)
                                dismiss()
                            }
                            .buttonStyle(.borderedProminent)
                            
                            
                            
                        }
                    }
                    
                }
                .onChange(of: inputImage, perform: {_ in loadImage()})
                .sheet(isPresented: $showImagePicker){
                    ImagePicker(image: $inputImage)
                }
            }
        }.navigationTitle("Add Expense")
        
    }
    func loadImage(){
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
        tisImage = true
        
    }
    
}

struct AddExpense_Previews: PreviewProvider {
    static let dataExpense = ExpenseData()
    static var previews: some View {
        AddExpense()
            .environmentObject(dataExpense)
    }
}
