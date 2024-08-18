//
//  UserDetailFeature.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/17.
//

import Foundation
import ComposableArchitecture

/// ユーザー詳細(リポジトリ)画面のReducer
@Reducer
struct UserDetailFeature {
    let userName: String
    let model: GithubModel
    /// ステート
    @ObservableState
    struct State: Equatable {
        /// 表示するユーザー
        var user: GIthubUserDetail?
        // 表示するリポジトリ
        var repositories: [GithubRepository] = []
    }
    /// アクション
    enum Action {
        /// 画面表示
        case onAppear
        /// ユーザー詳細とリポジトリ一覧取得
        case fetchDetailAndRepositoryResponse(_ prm: (detail: GIthubUserDetail?, repos: [GithubRepository]))
        /// リポジトリをタップ
        case repositoryTapped(urlString: String)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    async let detail = try? await model.fetchUserDetail(userName: userName)
                    async let repos = try? await model.fetchUserRepository(userName: userName)
                    let prm = (await detail, (await repos ?? []))
                    await send(.fetchDetailAndRepositoryResponse(prm))
                }
            case .fetchDetailAndRepositoryResponse(let prm):
                state.user = prm.detail
                state.repositories = prm.repos
                return .none
            case .repositoryTapped:
                // TODO: タップ時にリポジトリのWebViewに遷移する
                return .none
            }
        }
    }
}
