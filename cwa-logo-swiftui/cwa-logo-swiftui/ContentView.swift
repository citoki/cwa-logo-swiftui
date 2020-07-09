//
//  ContentView.swift
//  cwa-logo-swiftui
//
//  Created by Froehlich, Steffen on 09.07.20.
//  Copyright © 2020 Froehlich, Steffen. All rights reserved.
//

import SwiftUI

extension Color {
    public static var cwaLightStart: Color {
        self.init(#colorLiteral(red: 0.7332266569, green: 0.8745614886, blue: 0.9724302888, alpha: 1))
    }
    public static var cwaLightBlue: Color {
        self.init(#colorLiteral(red: 0.5174953938, green: 0.8078919053, blue: 0.9292961359, alpha: 1))
    }
    public static var cwaMiddle: Color {
        self.init(#colorLiteral(red: 0.5646429062, green: 0.6078800559, blue: 0.678347528, alpha: 1))
    }
    public static var cwaDarkRed: Color {
        self.init(#colorLiteral(red: 0.6666719913, green: 0.2941357493, blue: 0.2823295891, alpha: 1))
    }
    public static var cwaDarkEnd: Color {
        self.init(#colorLiteral(red: 0.7333530188, green: 0.07843678445, blue: 0.01188994944, alpha: 1))
    }
}

struct CwaRing: View {
    private var ringThickness: CGFloat = 170.0
    private var gradient = [
        Color.cwaLightStart,
        Color.cwaLightBlue,
        Color.cwaMiddle,
        Color.cwaDarkRed,
        Color.cwaDarkEnd
    ]

    var body: some View {
        GeometryReader { geometry in
            Circle()
                .trim(from: 0.15, to: 0.85)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: self.gradient),
                        startPoint: .top, endPoint: .bottom),
                        style: StrokeStyle(
                            lineWidth: geometry.size.width / 3,
                            lineCap: .butt)
                )
                .frame(
                    width: geometry.size.width - geometry.size.width / 3,
                    height: geometry.size.height - geometry.size.width / 3
                )
        }
    }
}

struct Ticks: View {
    var ticks: Int
   
    func tick(at tick: Int) -> some View {
        ZStack {
            GeometryReader { geometry in
                VStack {

                    Rectangle()
                        .fill(Color.white)
                        .frame(width: geometry.size.width / 20, height: geometry.size.width / 3.7)
                    
                    Spacer()
                        
                }.rotationEffect(Angle.degrees(Double(tick)/Double(self.ticks) * 360))
            }
            GeometryReader { geometry in
                VStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: geometry.size.width / 8, height: geometry.size.width / 8)
                        .offset(x: 0.0, y: geometry.size.width / 2.2)

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

struct ContentView: View {
    @State var dynamicSize: CGFloat = 300
    var body: some View {
        VStack {
            Slider(value: $dynamicSize, in: 100...500)
            Spacer()
            ZStack {
                CwaRing().frame(width: dynamicSize, height: dynamicSize)
                Ticks(ticks: 8).frame(width: dynamicSize/1.6, height: dynamicSize/1.6)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
       Group {
          ContentView()
             .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
             .previewDisplayName("iPhone 11")
       }
    }
}

