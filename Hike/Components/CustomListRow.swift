//
//  CustomListRow.swift
//  Hike
//
//  Created by Metehan Özden on 16.10.2024.
//

import SwiftUI

struct CustomListRow: View {
    
    @State var rowLabel: String
    @State var rowImage: String
    @State var rowContent: String? = nil
    @State var rowColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil

    var body: some View {
        LabeledContent{
            if rowContent  != nil{
                Text(rowContent!)

            }else if rowLinkDestination != nil && rowLinkLabel != nil{
                Link(destination: URL(string: rowLinkDestination!)!) {
                    Text(rowLinkLabel!)
                }
            }
        } label:{
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowColor)
                    
                    Image(systemName: rowImage)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
        
    }
}

#Preview {
    List(){
        CustomListRow(rowLabel: "Application", rowImage: "heart", rowContent: "New", rowColor: .pink)

    }
}
