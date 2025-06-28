//
//  PostData.swift
//  Hacker News
//
//  Created by Gururaja M on 28/06/25.
//

import Foundation

struct Result: Decodable {
    let hits:[Post]
}

struct Post: Decodable,Identifiable {
    var id: String {
        return objectID
    }
    let objectID:String
    let points:Int
    let title:String
    let url:String
}
