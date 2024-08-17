//
//  UserListFeature.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/17.
//

import Foundation
import ComposableArchitecture

/// ユーザー一覧画面のReducer
@Reducer
struct UserListFeature {
    let model: GithubModel
    /// ステート
    @ObservableState
    struct State: Equatable {
        /// 表示するユーザーリスト
        var users: [GithubUser] = []
    }
    /// アクション
    enum Action {
        /// 画面表示
        case onAppear
        /// ユーザー一覧取得
        case fetchUserResponse(_ users: [GithubUser])
        /// ユーザーをタップ
        case userTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    let users = try? await model.fetchUserList()
                    // エラーの場合は0件とみなす
                    await send(.fetchUserResponse(users ?? []))
                }
            case .fetchUserResponse(let users):
                state.users = users
                return .none
            case .userTapped:
                // TODO: タップ時にユーザーリポジトリ画面に遷移する
                return .none
            }
        }
    }
}
