//
//  UserListView.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/17.
//

import SwiftUI
import ComposableArchitecture

struct UserListView: View {
    @ComposableArchitecture.Bindable var store: StoreOf<UserListFeature>

    
    var body: some View {
        NavigationView {
            ZStack {
                if store.users.isEmpty {
                    Text("エラーまたは0件")
                } else {
                    List(store.users) { user in
                        NavigationLink(item: $store.scope(state: \.destination?.detail, action: \.destination.detail),
                                       check: { store.selectedUserID == user.id },
                                       onNavigate: { _ in store.send(.userTapped((name: user.name, id: user.id))) },
                                       destination: { store in UserDetailView(store: store) }) {
                            UserView(user: user)
                        }
                    }
                }
            }
            .navigationTitle("ユーザー一覧")
            .onAppear {
                store.send(.onAppear)
            }
        }
    }
}

extension GithubUser: Identifiable {}

#Preview {
    UserListView(store: .init(initialState: UserListFeature.State()) {
        UserListFeature()
    })
}

