//
//  virusLogoGradient.swift
//  cwa-logo-swiftui
//
//  Created by Froehlich, Steffen on 13.07.20.
//  Copyright © 2020 Froehlich, Steffen. All rights reserved.
//

import SwiftUI

struct VirusTentacles: View {
    var ticks: Int
   
    func tick(at tick: Int) -> some View {
        ZStack {
            GeometryReader { geometry in
                VStack {

                    Rectangle()
                        .fill(Color.white)
                        .frame(width: geometry.size.width / 25, height: geometry.size.width * 0.5)
                    
                    Spacer()
                        
                }.rotationEffect(Angle.degrees(Double(tick)/Double(self.ticks) * 360))
            }
            GeometryReader { geometry in
                VStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: geometry.size.width * 0.125, height: geometry.size.width * 0.125)
                        .offset(x: 0.0, y: geometry.size.width * -0.44)

                }.rotationEffect(Angle.degrees(Double(tick)/Double(self.ticks) * 360))
            }
        }
    }
    
    
    var body: some View {
        ForEach(0..<ticks) { tick in
            self.tick(at: tick)
        }
    }
}

struct VirusLogoGradient: View {
    @State private var dynamicSize: CGFloat = 300
    @State private var rotation = 0.0
    
    private let gradient = [Color(#colorLiteral(red: 0.7332266569, green: 0.8745614886, blue: 0.9724302888, alpha: 1)), Color(#colorLiteral(red: 0.5174953938, green: 0.8078919053, blue: 0.9292961359, alpha: 1)), Color(#colorLiteral(red: 0.5646429062, green: 0.6078800559, blue: 0.678347528, alpha: 1)), Color(#colorLiteral(red: 0.6352864504, green: 0.3882589936, blue: 0.3999554813, alpha: 1)), Color(#colorLiteral(red: 0.6745182872, green: 0.262761265, blue: 0.2392017543, alpha: 1))]
    
    var body: some View {
        VStack {
            Slider(value: $dynamicSize, in: 50...400).padding()
            
            Spacer()
            
            Button(action: {
                self.rotation += 560
            }) {
                Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: .topLeading, endPoint: .bottomTrailing))
                .mask(
                    ZStack {
                        Circle()
                            .frame(width: self.dynamicSize * 0.5, height: self.dynamicSize * 0.5)
                            
                        
                        VirusTentacles(ticks: 8)
                            .frame(width: self.dynamicSize, height: self.dynamicSize)
                    }
                )
                .frame(width: self.dynamicSize, height: self.dynamicSize)
                .animation(nil)
                
                // rotation animation
                .rotationEffect(.degrees(self.rotation))
                .animation(.easeInOut(duration: 1.5))
            }
            
            Spacer()
        }
    }
}

struct VirusLogoGradient_Previews: PreviewProvider {
    static var previews: some View {
        VirusLogoGradient()
    }
}
