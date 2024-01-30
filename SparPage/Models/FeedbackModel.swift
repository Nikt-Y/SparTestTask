//
//  FeedbackModel.swift
//  SparPage
//
//  Created by Nik Y on 30.01.2024.
//

import Foundation

/// Модель отзыва
struct FeedbackModel: Identifiable {
    let id: Int
    let author: String
    let date: String
    let starCount: Int
    let text: String
}

