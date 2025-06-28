//
//  PostData.swift
//  Hacker News
//
//  Created by Gururaja M on 28/06/25.
//

import Foundation

// Top-level result matching the JSON "hits" array
struct Result: Decodable {
    let hits: [Post]
}

// Each individual post
struct Post: Decodable, Identifiable {
    var id: String { objectID }

    let objectID: String
    let title: String
    let url: String?
    let points: Int?
    let author: String?
    let num_comments: Int?
    let created_at: String?
}



