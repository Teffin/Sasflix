//
//  PostsBindings.swift
//  Sasflix
//
//  Created by Evgeniy Kozyrev on 06.11.2024.
//

import Combine


struct PostsBindings {
    public let onCommentTap: PassthroughSubject<Int, Never> = .init()
    public let onLikeTap: PassthroughSubject<Int, Never> = .init()
    public let onDislikeTap: PassthroughSubject<Int, Never> = .init()
}

