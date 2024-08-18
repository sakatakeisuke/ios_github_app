//
//  UserDetailView.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/17.
//

import SwiftUI
import ComposableArchitecture

struct UserDetailView: View {
    @ComposableArchitecture.Bindable var store: StoreOf<UserDetailFeature>

    var body: some View {
        VStack {
            UserDetailProfileView(userDetail: store.state.user)
            List(store.repositories) { repo in
                NavigationLink(item: $store.scope(state: \.destination?.web,
                                                  action: \.destination.web),
                               check: { store.selectedRepositoryID == repo.id },
                               onNavigate: { _ in
                    guard let url = URL(string: repo.transitionURL) else { return }
                    store.send(.repositoryTapped((url: url, id: repo.id)))
                }, destination: { store in StateFulWebView(store: store) }) {
                    UserDetailRepositoryView(repo: repo)
                }
            }
        }
        .onAppear {
            store.send(.onAppear)
        }
    }
}

#Preview {
    UserDetailView(store: Store(initialState: UserDetailFeature.State(userName: "A")) {
        UserDetailFeature()
    })
}
    
extension GithubRepository: Identifiable {}
