//
//  PaidButton.swift
//  LetsLearn
//
//  Created by user232479 on 3/17/23.
//

import SwiftUI

struct PaidButton: View {
    @Binding var isSet: Bool
    var body: some View {
        Button{
            isSet.toggle()
        }label: {
            Label("Pay expense ", systemImage: isSet ? "checkmark.circle.fill": "circle")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .purple: .red)
                .buttonStyle(.plain	)
        }
    }
}


struct PaidButton_Previews: PreviewProvider {
    
    static var previews: some View {
        PaidButton(isSet: .constant(true))
    }
}
