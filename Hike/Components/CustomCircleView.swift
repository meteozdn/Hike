//
//  CustomCircleView.swift
//  Hike
//
//  Created by Metehan Özden on 16.10.2024.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient = false
    var body: some View {
        ZStack {
            Circle().fill(LinearGradient(
                colors: [
                    .customIndigoMedium,
                    .customSalmonLight
                ],
                startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing)
            ).onAppear{
                withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)){
                    isAnimateGradient.toggle()
                }
            }.frame(width: 256, height: 256)
            MotionAnimationView() 
        }
    }

}

#Preview {
    CustomCircleView()
}
