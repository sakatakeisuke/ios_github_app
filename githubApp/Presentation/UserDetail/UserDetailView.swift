//
//  UserDetailView.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/17.
//

import SwiftUI
import ComposableArchitecture

struct UserDetailView: View {
    let store: StoreOf<UserDetailFeature>

    var body: some View {
        VStack {
            UserDetailProfileView(userDetail: store.state.user)
            List(store.repositories) { repo in
                UserDetailRepositoryView(repo: repo)
            }
        }
        .onAppear {
            store.send(.onAppear)
        }
    }
}

#Preview {
    UserDetailView(store: Store(initialState: UserDetailFeature.State()) {
        UserDetailFeature(userName: "sakatakeisuke", model: GithubModel())
    })
}
    
extension GithubRepository: Identifiable {}
