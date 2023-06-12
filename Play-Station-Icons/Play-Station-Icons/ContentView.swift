//
//  ContentView.swift
//  Play-Station-Icons
//
//  Created by User-P2 on 6/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PlayStationIcons()
    }
}

struct PlayStationIcons: View {
    @State private var square: Bool = false
    @State private var triangle: Bool = false
    @State private var circle: Bool = false
    @State private var cross: Bool = false
    
    var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea(.all)
            
            VStack {
                
                HStack {
                    
                    Figure(imageName: "square", customColor: Color.pink)
                    
                    Figure(imageName: "triangle", customColor: Color.green)
                }
                
                HStack {
                    
                    Figure(imageName: "circle", customColor: Color.red)
                    
                    Figure(imageName: "cross", customColor: Color.blue)
                }
                
                if let url = URL(string: "https://github.com/Rexmoon") {
                    Link(destination: url) {
                        Text("Tap to see my little GITHUB profile!")
                            .padding()
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .shadow(color: Color.blue, radius: 2, x: 0, y: 5)
                    }
                }
            }
        }
    }
}

struct Figure: View {
    
    @State internal var isPresent: Bool = false
    
    var imageName: String = ""
    var customColor: Color = .blue
    
    var body: some View {
        
        Image(systemName: imageName)
            .resizable()
            .frame(width: 100, height: 100, alignment: .center)
            .foregroundColor(customColor)
            .shadow(color: customColor, radius: 10, x: 0, y: 0)
            .rotationEffect(.degrees(isPresent ? 360 : 0))
            .scaleEffect(isPresent ? 1 : 0.5)
            .animation(Animation.easeInOut(duration: 1).delay(0.5).repeatForever(autoreverses: true))
            .onAppear {
                isPresent.toggle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
