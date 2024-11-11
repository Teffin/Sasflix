//
//  Comment.swift
//  Sasflix
//
//  Created by Evgeniy Kozyrev on 05.11.2024.
//

import Foundation

struct Comment: Decodable {
    let id: UInt
    let body: String
    let postId: UInt
    let likes: Int
//    let users: [User]
}
