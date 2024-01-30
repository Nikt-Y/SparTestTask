//
//  Styles.swift
//  SparPage
//
//  Created by Nik Y on 30.01.2024.
//

import SwiftUI

struct GreenButton: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.vertical, 8)
            .frame(minWidth: 0, maxWidth: .infinity)
            .font(.headline)
            .overlay(
                Capsule()
                    .stroke(Color.green, lineWidth: 2)
            )
            .foregroundColor(.green)
            .scaleEffect(configuration.isPressed ? 0.93 : 1)
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}
