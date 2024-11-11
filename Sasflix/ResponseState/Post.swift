//
//  Post.swift
//  Sasflix
//
//  Created by Evgeniy Kozyrev on 05.11.2024.
//

import Foundation

struct Post: Decodable {
    let id: UInt
    let title: String
    let body: String
    let tags: [String]
    let reactions: Reactions
    let views: UInt
    let userId: UInt
}
