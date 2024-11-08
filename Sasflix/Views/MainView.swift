//
//  MainView.swift
//  Sasflix
//
//  Created by Evgeniy Kozyrev on 07.11.2024.
//

import SwiftUI
import Combine

class MainViewState: ObservableObject {
    enum MainState {
        case loading
        case posts(PostsViewState)
        case commentPost(CommentPostViewState)
    }

    @Published var state: MainState = .loading
}

struct MainView: View {
    @ObservedObject var state: MainViewState
    let bindings: MainViewBindings
    
    var body: some View {
        NavigationStack {
            switch state.state {
            case .loading:
                Text("Loading...")
            case .posts(let state):
                PostsView(
                    bindings: bindings,
                    state: state
                )

            case .commentPost(let state):
                
                Text("Loading.2 \(state)")
            }
        }
        .navigationDestination(for: PostsView.self) { post in
            Text("Loading.2 \(post)")
        }
    }
    
    init(state: MainViewState, bindings: MainViewBindings) {
        self.state = state
        self.bindings = bindings
    }
}

#Preview {
    MainView(state: .init(), bindings: .init())
}

