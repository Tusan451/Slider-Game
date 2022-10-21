//
//  SliderView.swift
//  Slider Game
//
//  Created by Olegio on 21.10.2022.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var thumbColor: UIColor
    @Binding var value: Double
    
    var body: some View {
        HStack(spacing: 12) {
            Text("0")
                .font(.system(size: 20, weight: .medium))
            ImportedUISlider(thumbColor: $thumbColor, value: $value)
            Text("100")
                .font(.system(size: 20, weight: .medium))
        }
        .padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(thumbColor: .constant(.orange), value: .constant(50))
    }
}
