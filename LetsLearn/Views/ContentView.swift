//
//  ContentView.swift
//  LetsLearn
//
//  Created by user232479 on 3/13/23.
//

import SwiftUI

struct ContentView: View {	
    var body: some View {
        
        ExpenseList().foregroundColor(Color.black)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ExpenseData())
    }
}
