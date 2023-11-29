//
//  ContentView.swift
//  FIN
//
//  Created by Foundation 7 on 26/11/2023.
//

import SwiftUI


struct ContentView: View {
    @State private var selection = 0
    @State private var choice = ""
    
    var starters = ["Posts", "Goals", "Interests"]
    
    var body: some View {
        
        VStack (alignment: .leading) {
            HStack (alignment: .center) {
                Image("AdobeStock_367263645 copy 5")
                    .resizable()
                    .padding([.top, .leading])
                    .frame(width:100, height:100)
                
                Text("Name")
            }
            Text("Bio")
                .multilineTextAlignment(.leading)
            Picker("Choose your starter",
                   selection: $choice) {
                ForEach(starters, id: \.self) {
                    Text($0)
                }
            }
                   .pickerStyle(.segmented)
        }
        
        
        TabView(selection: $selection){
            Text("1")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "list.dash")
                        Text("Dashbord")
                    }
                }
                .tag(0)
            Text("2")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "person.2.crop.square.stack")
                        Text("Timeline")
                    }
                }
                .tag(1)
            Text("3")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle.fill")
                        Text("Profile")
                    }
                }
                .tag(2)
        }
        
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
