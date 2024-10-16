//
//  CardView.swift
//  Hike
//
//  Created by Metehan Özden on 15.10.2024.
//

import SwiftUI

struct CardView: View {
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    func randomImage(){
        repeat{
            randomNumber = Int.random(in: 1...5)
        }while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack{
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(
                                colors: [
                                    .customGrayLight,
                                    .customGrayMedium
                                    
                                ],
                                startPoint: .top,
                                endPoint: .bottom)
                            )
                        
                        Spacer()
                        Button{
                            isShowingSheet.toggle()
                            
                            print("button pressed")
                        } label:{
                            CustomButtomView()
                        }.sheet(isPresented: $isShowingSheet, content: {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        })
                    }
                    Text("Fun and enjoyable outdoor activities for all ages and abilities.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }.padding(.horizontal, 30)
                
                
                
                ZStack{
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeInOut(duration: 0.5), value: imageNumber)
                }
                
                Button{
                    randomImage()
                }label:{
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(
                            colors: [
                                .customGreenLight,
                                .customGreenMedium
                            ],
                            startPoint: .top,
                            endPoint: .bottom))
                }.buttonStyle(GradientButtonStyle())

            }

        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
