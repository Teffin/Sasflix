//
//  PostsViewState.swift
//  Sasflix
//
//  Created by Evgeniy Kozyrev on 07.11.2024.
//

import Combine
import Foundation

class PostsViewState: ObservableObject, Hashable {
    static func == (lhs: PostsViewState, rhs: PostsViewState) -> Bool {
        return lhs.posts == rhs.posts
            && lhs.skip == rhs.skip
        && lhs.limit == rhs.limit
        && lhs.total == rhs.total
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(posts)
        hasher.combine(total)
        hasher.combine(skip)
        hasher.combine(limit)
    }
    
    struct ReactionsState: Hashable {
        var likes: Int
        var dislikes: Int
        
        init(_ reactions: Reactions) {
            self.likes = reactions.likes
            self.dislikes = reactions.dislikes
        }
    }
    
    struct Tag: Identifiable, Hashable {
        var id = UUID()
        
        let tag: String
    }
    
    struct PostState: Identifiable, Hashable {
        static func == (lhs: PostState, rhs: PostState) -> Bool {
            return lhs.id == rhs.id
                && lhs.title == rhs.title
            && lhs.body == rhs.body
            && lhs.tags == rhs.tags
            && lhs.reactions == rhs.reactions
            && lhs.views == rhs.views
            && lhs.userId == rhs.userId

        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(title)
            hasher.combine(body)
            hasher.combine(tags)
            hasher.combine(reactions)
            hasher.combine(views)
            hasher.combine(userId)

        }
        
        let id: UInt
        let title: String
        let body: String
        let tags: [Tag]
        var reactions: ReactionsState
        let views: UInt
        let userId: UInt
        
        init(id: UInt, title: String, body: String, tags: [Tag], reactions: ReactionsState, views: UInt, userId: UInt) {
            self.id = id
            self.title = title
            self.body = body
            self.tags = tags
            self.reactions = reactions
            self.views = views
            self.userId = userId
        }
        
        init(post: Post) {
            let tags = post.tags.map { Tag(tag: $0) }
            
            self.init(id: post.id, title: post.title, body: post.body, tags: tags, reactions: ReactionsState(post.reactions), views: post.views, userId: post.userId)
        }
    }
    
    var posts: [PostState]
    let total: UInt64
    let skip: UInt64
    let limit: UInt64
    
    init(posts: [PostState],
         total: UInt64,
         skip: UInt64,
         limit: UInt64) {
        self.posts = posts
        self.total = total
        self.skip = skip
        self.limit = limit
    }
    
    init(posts: Posts) {
        self.posts = posts.posts.map { PostState(post: $0) }
        self.total = posts.total
        self.skip = posts.skip
        self.limit = posts.limit
    }
}
