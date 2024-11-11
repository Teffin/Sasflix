//
//  Posts.swift
//  Sasflix
//
//  Created by Evgeniy Kozyrev on 05.11.2024.
//

struct Posts: Decodable {
    let posts: [Post]
    let total: UInt64
    let skip: UInt64
    let limit: UInt64
}
