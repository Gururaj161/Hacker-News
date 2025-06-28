//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Gururaja M on 28/06/25.
//

import Foundation

class NetworkManager:ObservableObject {
    
    @Published var posts:[Post] = []
    
    func fetchData(){
        
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    do {
                        let responseModel = try decoder.decode(Result.self, from: data!)
                        DispatchQueue.main.async {
                            self.posts = responseModel.hits
                        }
                    } catch {
                        print("Error parsing: \(error)")
                    }
                    
                }
            }
            task.resume()
            
        }
    }
}
