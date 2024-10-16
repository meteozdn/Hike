//
//  SettingsView.swift
//  Hike
//
//  Created by Metehan Özden on 16.10.2024.
//

import SwiftUI

struct SettingsView: View {
    private let appIcons = [
        "AppIcon-Backpack",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom"
    ]
    var body: some View {
        
        List{
            Section{
                HStack{
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 66, weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor's Choice")
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 66, weight: .black))
                    Spacer()
                }.foregroundStyle(LinearGradient(
                    colors: [
                        .customGreenLight,
                        .customGreenMedium,
                        .customGreenDark
                    ],
                    startPoint: .top,
                    endPoint: .bottom)
                ).padding(.top, 8)
                VStack(spacing: 8){
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("The hike app is a free and open source app that allows you to find perfect hiking trails around the world. New hiking trails are added every day, so you can always find a new one to explore.")
                        .font(.footnote)
                        .italic()
                    Text("Dust of the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenDark)
                }.multilineTextAlignment(.center)
                    .padding(.bottom, 16)
                    .frame(maxWidth: .infinity)
            }
            Section(header: Text("Alternate App Icons")){
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(appIcons.indices, id: \.self) { item in
                            Button{
                                UIApplication.shared.setAlternateIconName(appIcons[item]){ error in
                                    if let error {
                                        print("Failed request to update App Icon")
                                    }else{
                                        print("You success updated App Icon")
                                    }
                                    
                                }
                            }label: {
                                Image("\(appIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:80 , height: 80)
                                    .cornerRadius(16)
                            }.buttonStyle(.borderless)
                        }
                    }
                }
                Text("Choose your favorite app icon from the collection above.")
                    .frame(maxWidth: .infinity, minHeight: 0)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                
                
            }.listRowSeparator(.hidden)
            
            Section(
                header: Text("About the App "),
                footer:HStack{
                    Spacer()
                    Text("Copyright All right reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
                
            ){
                CustomListRow(rowLabel: "Application", rowImage: "apps.iphone", rowContent: "HIKE", rowColor: .blue)
                CustomListRow(rowLabel: "Compatility", rowImage: "info.circle", rowContent: "iOS", rowColor: .red)
                CustomListRow(rowLabel: "Technology", rowImage: "swift", rowContent: "Swift", rowColor: .orange)
                CustomListRow(rowLabel: "Version", rowImage: "gear", rowContent: "1.0", rowColor: .purple)
                CustomListRow(rowLabel: "Developer", rowImage: "ellipsis.curlybraces", rowContent: "Metehan Özden", rowColor: .mint)
                CustomListRow(rowLabel: "Designer", rowImage: "paintpalette", rowContent: "Robert Petras", rowColor: .pink)
                CustomListRow(rowLabel: "Website", rowImage: "globe", rowColor: .indigo, rowLinkLabel: "github/meteozdn", rowLinkDestination: "htpps//github.com/meteozdn")



            }
        }
    }
}

#Preview {
    SettingsView()
}
