//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Metehan Özden on 16.10.2024.
//

import SwiftUI

struct GradientButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .shadow(color: .black.opacity(0.5), radius: 0.25, x:1, y:2)
            .padding(.horizontal, 30)
            .padding(.vertical)
            .background(
                configuration.isPressed ?
                LinearGradient(
                    colors: [
                        .customGrayMedium,
                        .customGrayLight
                    ],
                    startPoint: .top,
                    endPoint: .bottom):
                LinearGradient(
                    colors: [
                        .customGrayLight,
                        .customGrayMedium
                    ],
                    startPoint: .top,
                    endPoint: .bottom)
            )
            .cornerRadius(40)
            
    }
    
}
