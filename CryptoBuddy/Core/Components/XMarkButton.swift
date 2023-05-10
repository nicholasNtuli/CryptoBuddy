//
//  XmarkButton.swift
//  CryptoBuddy
//
//  Created by Sihle Ntuli on 2023/05/09.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
            print("button tapped")
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

struct XmarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
            .previewLayout(.sizeThatFits)
    }
}
