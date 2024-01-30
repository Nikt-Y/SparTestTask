//
//  FeedbackView.swift
//  SparPage
//
//  Created by Nik Y on 30.01.2024.
//

import SwiftUI

/// Представление отзыва
struct FeedbackView: View {
    var author: String
    var date: String
    var starsNum: Int
    var text: String
    
    init(author: String, date: String, starsNum: Int, text: String) {
        self.author = author
        self.date = date
        self.starsNum = max(min(starsNum, 5), 0)
        self.text = text
    }
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 241, height: 150)
                .shadow(radius: 5)
                .overlay(
                    VStack(alignment: .leading, spacing: 7) {
                        Text(author)
                            .font(.headline)
                        Text(date)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        HStack {
                            ForEach(0..<starsNum, id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.yellow)
                            }
                            ForEach(starsNum..<5, id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.gray)
                            }
                        }
                        Text(text)
                            .font(.system(size: 14))
                    }
                        .padding(.horizontal)
                )
        }
        .padding(.vertical, 15)
    }
}
