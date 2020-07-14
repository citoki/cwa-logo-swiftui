//
//  ContentView.swift
//  cwa-logo-swiftui
//
//  Created by Froehlich, Steffen on 13.07.20.
//  Copyright © 2020 Froehlich, Steffen. All rights reserved.
//

import SwiftUI

struct NavItem: Identifiable {
    var id = UUID()
    var dest: AnyView
    var name: String
    var subtitle: String
}

struct ContentView: View {
    let navItems = [
        NavItem(dest: AnyView(CwaLogoView()), name: "Corona Warn App Logo", subtitle: "… app icon logo"),
        NavItem(dest: AnyView(VirusLogoGradient()), name: "CWA Virus Logo", subtitle: "litte virus logo with colors 🎨")
    ]

    var body: some View {
        NavigationView {
            List(navItems) { navItem in
                NavigationLink(destination: navItem.dest) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(navItem.name).font(.headline)
                        Text(navItem.subtitle)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }.navigationBarTitle(Text("CWA drawings"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
