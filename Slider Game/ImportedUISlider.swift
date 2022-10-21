//
//  ImportedUISlider.swift
//  Slider Game
//
//  Created by Olegio on 20.10.2022.
//

import SwiftUI

struct ImportedUISlider: UIViewRepresentable {
    
    let thumbColor: UIColor
    @Binding var value: Double
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        
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
        Coordinator(value: $value)
    }
}

extension ImportedUISlider {
    
    class Coordinator: NSObject {
        
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct ImportedUISlider_Preeviews: PreviewProvider {
    static var previews: some View {
        ImportedUISlider(thumbColor: .orange, value: .constant(50))
    }
}
