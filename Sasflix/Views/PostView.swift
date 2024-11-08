//
//  PostView.swift
//  Sasflix
//
//  Created by Evgeniy Kozyrev on 08.11.2024.
//

import SwiftUI

struct PostView: View {
    var state: PostsViewState.PostState
    let bindings: MainViewBindings
    
    var body: some View {
            VStack(alignment: .leading) {
                Text(state.title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 16)
                
                Text(state.body)
                
                HStack {
                    HStack(alignment: .center) {
                        
                        Button("Like") {
//                            bindings.onLikeTap.send()
                        }
                        .padding(.leading, 16)
                        .background(Color(.systemGray2))
                        //                    .background(color)
                        
                        Button("DisLike") {
//                            bindings.onDislikeTap.send()
                        }
                        .padding(.trailing, 16)
                        .background(Color(.systemGray2))
                        //                    .background(color)
                    }
                    
                    NavigationLink("Open Comments") {
                        Button(action: {
                            bindings.onCommentTap.send(state.id)
                            
                        }) {
//                            Text("Open Comments")
//                                .foregroundStyle(.orange)
//                                .underline()
                        }
                    }
                    
                }
                
                Text("Today")
                    .foregroundColor(Color(.systemGray2))
                
                HStack {
                    ForEach(state.tags) { tag in
                        Text(tag.tag)
                    }
                }
            }
            
        
    }
}

//#Preview {
//    PostView(state: .init(), bindings: .init())
//}
