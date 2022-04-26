//
//  PostMOdel.swift
//  JasonPlacholderAPIs
//
//  Created by Admin on 25/04/22.
//

import Foundation

struct Post : Decodable {
    var id: Int
    var userId: Int
    var title: String
    var body: String
}

struct Constant {
    static let apiUrl: String =  "https://jsonplaceholder.typicode.com/posts"
}
