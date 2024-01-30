//
//  ProductCardView.swift
//  SparPage
//
//  Created by Nik Y on 30.01.2024.
//

import SwiftUI

/// Карточка товара
struct ProductCardView: View {
    @State private var unit = "шт"
    @State private var quantity = 0.0
    @State private var isInCart = false
    
    let pricePerKG = 600.0 // Цена за килограмм
    let pricePerPiece = 120.0 // Цена за штуку
    let weightPerPiece = 0.2 // Вес одной штуки в килограммах
    
    // Отзывы
    let reviews: [FeedbackModel] = [
        FeedbackModel(
            id: 1,
            author: "Александр В.",
            date: "7 мая 2021",
            starCount: 4,
            text: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"
        ),
        FeedbackModel(
            id: 2,
            author: "Александр В.",
            date: "7 мая 2021",
            starCount: 0,
            text: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"
        ),
        FeedbackModel(
            id: 3,
            author: "Александр В.",
            date: "7 мая 2021",
            starCount: 5,
            text: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"
        )
    ]
    
    
    var body: some View {
        VStack {
            topButtonBar()
            Divider()
            MainScrollViewContent(feedbacks: reviews)
            Divider()
            bottomControlPanel()
        }
    }
    
    // MARK: - TopButtonBar
    private func topButtonBar() -> some View {
        HStack(spacing: 25) {
            Button(action: {}) {
                Image(systemName: "arrow.left")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 25)
                    .foregroundColor(Color.green)
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 25)
                    .foregroundColor(Color.green)
            }
            Button(action: {}) {
                Image(systemName: "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 25)
                    .foregroundColor(Color.green)
            }
            Button(action: {}) {
                Image(systemName: "list.clipboard")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 25)
                    .foregroundColor(Color.green)
            }
        }
        .padding(.horizontal)
    }
    
    // MARK: - MainScrollViewContent
    struct MainScrollViewContent: View {
        let feedbacks: [FeedbackModel]
        
        var body: some View {
            ScrollView {
                VStack {
                    ZStack(alignment: .topLeading) {
                        Image("lipa")
                            .resizable()
                            .scaledToFit()
                        
                        Text("Цена по карте")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .padding(4)
                            .background(Color.green)
                            .cornerRadius(5)
                            .padding([.leading, .top])
                    }
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Text("4.1")
                        Text("| 19 отзывов")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 14))
                        Spacer()
                        Text("-5%")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .padding(4)
                            .background(Color.red)
                            .cornerRadius(5)
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Добавка \"Липа\" к чаю 200 г")
                            .font(.largeTitle)
                            .bold()
                        
                        HStack {
                            Image("spain")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25, height: 25)
                                .clipShape(Circle())
                            Text("Испания, Риоха")
                                .font(.subheadline)
                        }
                        .padding([.leading, .bottom], 10)
                        
                        Text("Описание")
                            .font(.headline)
                            .padding(.bottom, 2)
                        Text("Флавоноиды липового цвета обладают противовоспалительным действием, способствуют укреплению стенок сосудов.")
                            .font(.system(size: 16))
                            .padding(.bottom, 10)
                        
                        
                        Text("Основные характеристики")
                            .font(.headline)
                            .padding(.bottom, 2)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            CharacteristicView(title: "Производство", value: "Россия, Краснодарский край")
                            
                            CharacteristicView(title: "Энергетическая ценность,\nккал/100 г", value: "25 ккал, 105 кДж")
                            CharacteristicView(title: "Жиры/100 г", value: "0,1 г")
                            CharacteristicView(title: "Белки/100 г", value: "1,3 г")
                            CharacteristicView(title: "Углеводы/100 г", value: "3,3 г")
                        }
                        .padding(.bottom)
                        
                        Button {
                            //
                        } label: {
                            Text("Все характеристики")
                                .font(.headline)
                                .foregroundColor(.green)
                        }
                        .padding(.bottom)
                        
                    }
                    .padding(.horizontal, 10)
                    
                    HStack {
                        Text("Отзывы")
                            .font(.headline)
                        Spacer()
                        Button {
                            //
                        } label: {
                            Text("Все 152")
                                .font(.headline)
                                .foregroundColor(.green)
                        }
                    }
                    .padding(.horizontal, 10)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 15) {
                            ForEach(feedbacks) { feedback in
                                FeedbackView(author: feedback.author, date: feedback.date, starsNum: feedback.starCount, text: feedback.text)
                            }
                        }
                        .padding(.horizontal)
                    }
                    Button("Оставить отзыв") {
                        // Действие для кнопки "Оставить отзыв"
                    }
                    .buttonStyle(GreenButton())
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
        }
    }
    
    // MARK: - BottomControlPanel
    private func bottomControlPanel() -> some View {
        VStack {
            Picker("Unit", selection: $unit) {
                Text("Шт").tag("шт")
                Text("Кг").tag("кг")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            .onChange(of: unit) { newValue in
                quantity = newValue == "кг" ? 0.1 : 1
                isInCart = false
            }
            
            
            HStack {
                
                VStack(alignment: .leading) {
                    HStack(alignment: .firstTextBaseline) {
                        Text("\(unit == "кг" ? pricePerKG : pricePerPiece, specifier: "%.1f")")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("₽")
                            .font(.title2)
                            .baselineOffset(8)
                        Text("/\(unit)")
                            .font(.callout)
                            .baselineOffset(0)
                    }
                    
                    Text("\(unit == "кг" ? pricePerKG + 200 : pricePerPiece + 40, specifier: "%.1f")")
                        .font(.caption)
                        .strikethrough()
                        .foregroundColor(.gray)
                }
                Spacer()
                
                HStack {
                    if isInCart && quantity > 0 {
                        Button(action: {
                            let step = unit == "кг" ? 0.1 : 1
                            quantity = max(quantity - step, 0)
                            isInCart = quantity > 0.01
                        }) {
                            Image(systemName: "minus")
                                .frame(width: 45, height: 45)
                        }
                        
                        VStack {
                            Text("\(quantity, specifier: unit == "кг" ? "%.1f кг" : "%.0f шт")")
                                .font(.headline)
                            Text("\(unit == "кг" ? pricePerKG * quantity : pricePerPiece * quantity, specifier: "%.2f") p")
                                .font(.caption)
                        }
                        .fixedSize(horizontal: true, vertical: false)
                        
                        Button(action: {
                            let step = unit == "кг" ? 0.1 : 1
                            quantity += step
                        }) {
                            Image(systemName: "plus")
                                .frame(width: 45, height: 45)
                        }
                        
                    } else {
                        Button("В корзину") {
                            isInCart = true
                            quantity = unit == "кг" ? 0.1 : 1
                        }
                        .padding()
                        .foregroundColor(.white)
                    }
                }
                .frame(minWidth: 175, minHeight: 45, maxHeight: 45)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(25)
            }
            .padding()
        }
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView()
    }
}

