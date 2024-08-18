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
    struct Dependencies {
        let userName: String
        let model: GithubModel
    }
    
    /// 遷移先一覧
    @Reducer
    enum Destination {
        case web(StateFulWebFeature)
    }

    /// ステート
    @ObservableState
    struct State {
        init(model: GithubModel = GithubModel(), userName: String) {
            self.dependencies = .init(userName: userName, model: model)
        }
        
        /// 外部から注入するオブジェクト
        let dependencies: Dependencies
        /// 表示するユーザー
        var user: GithubUserDetail?
        // 表示するリポジトリ
        var repositories: [GithubRepository] = []
        /// タップしたユーザーのリポジトリ名(Listの要素判定用)
        var selectedRepositoryID: Int?
        /// 遷移先
        @Presents var destination: Destination.State?
    }
    /// アクション
    enum Action {
        /// 画面表示
        case onAppear
        /// ユーザー詳細とリポジトリ一覧取得
        case fetchDetailAndRepositoryResponse(_ prm: (detail: GithubUserDetail?, repos: [GithubRepository]))
        /// リポジトリをタップ
        case repositoryTapped((url: URL, id: Int))
        /// 画面遷移アクション
        case destination(PresentationAction<Destination.Action>)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { [state] send in
                    async let detail = try? await state.dependencies.model.fetchUserDetail(userName: state.dependencies.userName)
                    async let repos = try? await state.dependencies.model.fetchUserRepository(userName: state.dependencies.userName)
                    let prm = (await detail, (await repos ?? []))
                    await send(.fetchDetailAndRepositoryResponse(prm))
                }
            case .fetchDetailAndRepositoryResponse(let prm):
                state.user = prm.detail
                state.repositories = prm.repos
                return .none
            case .repositoryTapped(let prm):
                let (url, id) = prm
                state.selectedRepositoryID = id
                state.destination = .web(StateFulWebFeature.State(url: url))
                return .none
            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
    }
}
