//
//  Comment.swift
//  Sasflix
//
//  Created by Evgeniy Kozyrev on 05.11.2024.
//

import Foundation

struct Comment {
    let id: UUID
    let body: String
    let postId: UUID
    let likes: Int
    let users: [User]
}
