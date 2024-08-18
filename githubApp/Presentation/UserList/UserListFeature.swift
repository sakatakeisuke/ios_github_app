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
    
    struct Dependencies {
        let model: GithubModel
    }
    
    /// 遷移先一覧
    @Reducer
    enum Destination {
        case detail(UserDetailFeature)
    }
    
    /// ステート
    @ObservableState
    struct State {
        init(model: GithubModel = GithubModel()) {
            self.dependencies = .init(model: model)
        }
        /// 外部から注入するオブジェクト
        let dependencies: Dependencies
        /// 表示するユーザーリスト
        var users: [GithubUser] = []
        /// タップしたユーザーのユーザー名(Listの要素判定用)
        var selectedUserID: Int?
        /// 遷移先
        @Presents var destination: Destination.State?
    }
    /// アクション
    enum Action {
        /// 画面表示
        case onAppear
        /// ユーザー一覧取得
        case fetchUsersResponse(_ users: [GithubUser])
        /// ユーザーをタップ
        case userTapped((name: String, id: Int))
        /// 画面遷移アクション
        case destination(PresentationAction<Destination.Action>)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { [state] send in
                    let users = try? await state.dependencies.model.fetchUserList()
                    // エラーの場合は0件とみなす
                    await send(.fetchUsersResponse(users ?? []))
                }
            case .fetchUsersResponse(let users):
                state.users = users
                return .none
            case .userTapped(let prm):
                let (userName, id) = prm
                state.selectedUserID = id
                state.destination = .detail(UserDetailFeature.State(userName: userName))
                return .none
            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
    }
}
