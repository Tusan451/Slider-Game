//
//  ContentView.swift
//  Slider Game
//
//  Created by Olegio on 20.10.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HeadText(text: "Подвинь слайдер как можно ближе к случайному значению")
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
            .font(.system(size: 24, weight: .medium))
            .lineSpacing(10)
            .frame(width: 340, alignment: .center)
            .padding()
    }
}
