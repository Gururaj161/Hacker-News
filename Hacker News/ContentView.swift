//
//  ContentView.swift
//  Hacker News
//
//  Created by Gururaja M on 28/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       NavigationView {
            List {
                Text("Hello, World!")
            }
            .navigationBarTitle("Hacker News")
        }
    }
}

#Preview {
    ContentView()
}
