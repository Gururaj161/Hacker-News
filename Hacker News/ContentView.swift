//
//  ContentView.swift
//  Hacker News
//
//  Created by Gururaja M on 28/06/25.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                Text("\(post.title)")
            }
            .navigationBarTitle("Hacker News")
        }.onAppear {
            self.networkManager.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
