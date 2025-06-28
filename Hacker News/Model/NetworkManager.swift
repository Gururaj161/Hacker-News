//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Gururaja M on 28/06/25.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts: [Post] = []
    
    func fetchData() {
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") else {
            print("❌ Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
                return
            }

            // Check response status code
            if let httpResponse = response as? HTTPURLResponse {
                print("🔁 Status Code: \(httpResponse.statusCode)")
                if httpResponse.statusCode != 200 {
                    print("❌ Unexpected response code: \(httpResponse.statusCode)")
                    return
                }
            }

            guard let data = data else {
                print("❌ No data received")
                return
            }

            let decoder = JSONDecoder()
            do {
                let responseModel = try decoder.decode(Result.self, from: data)
                DispatchQueue.main.async {
                    self.posts = responseModel.hits
                }
            } catch {
                print("❌ JSON decoding error: \(error.localizedDescription)")
                if let rawJSON = String(data: data, encoding: .utf8) {
                    print("🔍 Raw JSON received:\n\(rawJSON)")
                }
            }
        }

        
        task.resume()
    }
}
