//
//  CustomBackButton.swift
//  Alelo
//
//  Created by Nikolas Gianoglou Coelho on 05/12/2023.
//

import SwiftUI

struct CustomBackButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
//                .bold()
                .font(.title3)
                .foregroundStyle(.red)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackButton()
    }
}
