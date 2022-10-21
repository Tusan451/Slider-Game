//
//  ImportedUISlider.swift
//  Slider Game
//
//  Created by Olegio on 20.10.2022.
//

import SwiftUI

struct ImportedUISlider: UIViewRepresentable {
    
    @Binding var thumbColor: UIColor
    @Binding var value: Double
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = thumbColor
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = thumbColor
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, thumbColor: $thumbColor)
    }
}

extension ImportedUISlider {
    
    class Coordinator: NSObject {
        
        @Binding var value: Double
        @Binding var thumbColor: UIColor
        
        init(value: Binding<Double>, thumbColor: Binding<UIColor>) {
            self._value = value
            self._thumbColor = thumbColor
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
            thumbColor = sender.thumbTintColor!
        }
    }
}

struct ImportedUISlider_Preeviews: PreviewProvider {
    static var previews: some View {
        ImportedUISlider(thumbColor: .constant(.red), value: .constant(50))
    }
}
