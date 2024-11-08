//
//  PostBindings.swift
//  Sasflix
//
//  Created by Evgeniy Kozyrev on 08.11.2024.
//

import Combine

struct PostBindings {
    public let onCommentTap: PassthroughSubject<UInt, Never> = .init()
    public let onLikeTap: PassthroughSubject<Void, Never> = .init()
    public let onDislikeTap: PassthroughSubject<Void, Never> = .init()
}
