//
//  GithubRemoteRepositoryImpl.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/18.
//

import Foundation

struct GithubRemoteRepositoryImpl: GithubRemoteRepository {
    func fetchUserList() async throws -> [GithubUser] {
        try await GithubUsersAPI().response().users.map { GithubUser.init(from: $0) }
    }
    
    func fetchUserDetail(userName: String) async throws -> GithubUserDetail {
        .init(from: try await GithubUserAPI(userName: userName).response())
    }
    
    func fetchUserRepository(userName: String) async throws -> [GithubRepository] {
        try await GithubRepoAPI(userName: userName).response().map { GithubRepository.init(from: $0) }
    }
}
