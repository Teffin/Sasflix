//
//  Post.swift
//  Sasflix
//
//  Created by Evgeniy Kozyrev on 05.11.2024.
//

import Foundation

struct Post {
    let id: UUID
    let title: String
    let body: String
    let tags: [Tag]
    let reactions: Reactions
    let views: Int
    let usetId: UUID
}
