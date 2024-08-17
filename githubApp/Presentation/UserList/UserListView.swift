//
//  UserListView.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/17.
//

import SwiftUI
import ComposableArchitecture

struct UserListView: View {
    let store: StoreOf<UserListFeature>

    var body: some View {
        ZStack {
            if store.users.isEmpty {
                Text("エラーまたは0件")
            } else {
                List(store.users) { user in
                    // TODO: タップ時動作
                    UserView(user: user)
                }
            }
        }
        .onAppear {
            store.send(.onAppear)
        }
    }
}

extension GithubUser: Identifiable {}

#Preview {
    UserListView(store: .init(initialState: UserListFeature.State()) {
        UserListFeature(model: GithubModel())
    })
}

