//
//  ContentView.swift
//  Calcount
//
//  Created by Giorgio Garofalo on 27/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .environmentObject(ModelData())
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Text("History")
                .tabItem {
                    Label("History", systemImage: "calendar")
                }
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }.background(.thinMaterial)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
