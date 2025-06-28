//
//  ContentView.swift
//  Hacker News
//
//  Created by Gururaja M on 28/06/25.
//

import SwiftUI

struct ContentView: View {
    @State var posts: [Post] = []
    var body: some View {
       NavigationView {
            List(posts) { post in
                Text("\(post.title)")
            }
            .navigationBarTitle("Hacker News")
        }
    }
}

#Preview {
    ContentView()
}
