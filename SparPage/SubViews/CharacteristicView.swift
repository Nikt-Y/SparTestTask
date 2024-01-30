//
//  CharacteristicView.swift
//  SparPage
//
//  Created by Nik Y on 30.01.2024.
//

import SwiftUI

/// Представление характеристики товара
struct CharacteristicView: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .lineLimit(2)
                .layoutPriority(1)
            Text(String(repeating: ".", count: 100))
                .font(.caption)
                .lineLimit(1)
                .layoutPriority(0)
            Text(value)
                .multilineTextAlignment(.trailing)
                .layoutPriority(1)
        }
        .font(.system(size: 14))
        
    }
}
