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
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text("\(post.points ?? 0)")
                        Text("\(post.title)")
                    }
                }
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
