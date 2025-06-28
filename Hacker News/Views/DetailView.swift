//
//  DetailView.swift
//  Hacker News
//
//  Created by Gururaja M on 29/06/25.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let url : String?
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "www.google.com")
}

struct WebView: UIViewRepresentable {
    let urlString: String?

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let urlString = urlString,
              let url = URL(string: urlString) else {
            return
        }

        let request = URLRequest(url: url)
        webView.load(request)
    }
}
