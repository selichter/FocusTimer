//
//  PrimaryButton.swift
//  FocusTimer
//
//  Created by Sarah Lichter on 6/5/21.
//

import SwiftUI

struct PrimaryButton: View {
    var action: () -> Void
    var buttonText: String
    var imageName: String
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: imageName)
                    .font(.system(size: 24, weight: .bold))
                Text(buttonText)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .padding()
        .cornerRadius(40)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(action: {}, buttonText: "Button Name", imageName: "play.fill")
    }
}
