//
//  GithubModel.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/17.
//

import Foundation

protocol GithubRemoteRepository {
    /// ユーザー一覧を取得する
    func fetchUserList() async throws -> [GithubUser]
    /// ユーザーの詳細情報を取得する
    func fetchUserDetail(userName: String) async throws -> GithubUserDetail
    /// ユーザーのリポジトリ一覧を取得する
    func fetchUserRepository(userName: String) async throws -> [GithubRepository]
}

struct GithubModel {
    
    init(repository: GithubRemoteRepository = GithubRemoteRepositoryImpl()) {
        self.repository = repository
    }
    
    let repository: GithubRemoteRepository
    /// ユーザー一覧を取得する
    func fetchUserList() async throws -> [GithubUser] {
        try await repository.fetchUserList()
    }
    
    /// ユーザーの詳細情報を取得する
    func fetchUserDetail(userName: String) async throws -> GithubUserDetail {
        try await repository.fetchUserDetail(userName: userName)
    }
    
    /// ユーザーのリポジトリ一覧を取得する
    func fetchUserRepository(userName: String) async throws -> [GithubRepository] {
        try await repository.fetchUserRepository(userName: userName)
    }
}
