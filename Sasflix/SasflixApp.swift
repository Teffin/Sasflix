//
//  SasflixApp.swift
//  Sasflix
//
//  Created by Evgeniy Kozyrev on 05.11.2024.
//

import SwiftUI
import Combine

struct MainViewBindings {
    public let onCommentTap: PassthroughSubject<UInt, Never> = .init()
}

//protocol MainRouterProtocol {
//    func showCommentPost()
//}

class MainViewModel {
    var cancellable: Set<Combine.AnyCancellable> = []
}

@main
struct SasflixApp: App {
    let r = aRequest()
    @StateObject var state = MainViewState()
    private var bindings: MainViewBindings = MainViewBindings()
    var vm = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView(state: state, bindings: bindings).onAppear() {
                setup(bindings: bindings)
                    .store(in: &vm.cancellable)
            }
        }
    }
    
    
    private func setup(bindings: MainViewBindings) -> any Sequence<AnyCancellable> {
        r.getPosts { result in
            Task {
                switch result {
                case .success(let object):
                    self.state.state = .posts(PostsViewState(posts: object))
                case .failure(_):
                    break
                }
            }
        }
        
        var cancellable: [Combine.AnyCancellable] = [
        bindings.onCommentTap.sink { postId in
            self.r.getCommentPost(postId: postId) { result in
                Task {
                    switch result {
                    case .success(let object):
//                        break
                        self.state.state = .commentPost(CommentPostViewState(comments: object))
                    case .failure(_):
                        break
                    }
                }
            }
        }
        ]
        return cancellable
    }
}

public extension Sequence<AnyCancellable> {
//    nonmutating func store<C>(in collection: inout C) where C: RangeReplaceableCollection, C.Element == AnyCancellable {
//        forEach { $0.store(in: &collection) }
//    }

    func store(in set: inout Set<AnyCancellable>) {
        forEach { $0.store(in: &set) }
    }
}
