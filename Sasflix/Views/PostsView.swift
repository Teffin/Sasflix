//
//  PostsView.swift
//  Sasflix
//
//  Created by Evgeniy Kozyrev on 07.11.2024.
//

import SwiftUI
import Combine

struct PostsView: View, Hashable {
    static func == (lhs: PostsView, rhs: PostsView) -> Bool {
        return lhs.state == rhs.state
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(state)
    }
    
    let bindings: MainViewBindings
    @ObservedObject var state: PostsViewState
    
    var body: some View {
        ScrollView {
            ForEach(state.posts) { post in
                PostView(state: post, bindings: bindings)
                    .padding(.bottom, 24)
                    .onAppear() {
//                        setup(bindings: <#T##PostsBindings#>)
                    }
            }
        }
        .padding(10)
    }
}

struct CommentPostViewState {
    init(comments _: Comments) {
//        self.comments = comments
    }
}
struct CommentPostView: View {
    var body: some View {
        Text("kek")
    }
}




#Preview {
    PostsView(bindings: .init(), state: .init(
        posts: [],
        total: 2,
        skip: 2,
        limit: 2
    ))
}
