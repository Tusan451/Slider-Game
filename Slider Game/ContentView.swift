//
//  ContentView.swift
//  Slider Game
//
//  Created by Olegio on 20.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var randomNumber = Double.random(in: 0...100)
    @State private var sliderValue = Double.random(in: 0...100)
    @State private var sliderThumb = UIColor.orange
    
    var body: some View {
        VStack(spacing: 32) {
            VStack {
                HeadText(text: "Подвинь слайдер как можно ближе к случайному значению")
                Text("\(lround(randomNumber))")
                    .font(.system(size: 32, weight: .medium))
                    .padding()
                SliderView(thumbColor: $sliderThumb, value: $sliderValue)
            }
            VStack (spacing: 16) {
                ButtonView(title: "Проверить", background: .blue, textColor: .white) {
                    ///
                }
                ButtonView(title: "Начать заново", background: .white, textColor: .blue) {
                    ///
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// HeadText View
struct HeadText: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(.center)
            .font(.system(size: 18, weight: .regular))
            .foregroundColor(.gray)
            .lineSpacing(8)
            .frame(width: 340, alignment: .center)
            .padding()
    }
}

// Button View
struct ButtonView: View {
    
    let title: String
    let background: Color
    let textColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .frame(width: UIScreen.main.bounds.size.width - 28, height: 50)
            .background(background)
            .foregroundColor(textColor)
            .font(.system(size: 17, weight: .medium))
            .cornerRadius(8)
            .padding(.horizontal)
    }
}
