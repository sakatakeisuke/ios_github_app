//
//  GithubModel.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/17.
//

import Foundation

struct GithubModel {
    /// ユーザー一覧を取得する
    func fetchUserList() async throws -> [GithubUser] {
        // TODO: Implements
        return [.init(id: 1,
                      name: "sakatakeisuke1",
                      imageURL: "https://avatars.githubusercontent.com/u/112773764?v=4"),
                .init(id: 2,
                      name: "sakatakeisuke2",
                      imageURL: "https://avatars.githubusercontent.com/u/112773764?v=4"),
                .init(id: 3,
                      name: "sakatakeisuke3",
                      imageURL: "https://avatars.githubusercontent.com/u/112773764?v=4")]
    }
    
    /// ユーザーの詳細情報を取得する
    func fetchUserDetail(userName: String) async throws -> GithubUserDetail {
        return .init(name: userName,
                     imageURL: "https://avatars.githubusercontent.com/u/112773764?v=4",
                     fullName: "Keisuke_Sakata",
                     followerCount: 3,
                     followeeCount: 3)
    }
    
    /// ユーザーのリポジトリ一覧を取得する
    func fetchUserRepository(userName: String) async throws -> [GithubRepository] {
        return [.init(id: 1, 
                      name: "repo１",
                      usedLanguage: "Swift",
                      starCount: 100,
                      description: "test",
                      transitionURL: "https://github.com/sakatakeisuke/ios_github_app"),
                .init(id: 2,
                      name: "repo2",
                      usedLanguage: "Kotlin", 
                      starCount: 999999999,
                      description: "説明あああああああああああああああああああああああ",
                      transitionURL: "https://github.com/sakatakeisuke/ios_github_app"),
                .init(id: 3,
                      name: "reop3",
                      usedLanguage: "Flutter",
                      starCount: 0,
                      description: "説明あああああああああああああああああああああああ説明あああああああああああああああああああああああ説明あああああああああああああああああああああああ説明あああああああああああああああああああああああ",
                      transitionURL: "https://github.com/sakatakeisuke/ios_github_app")]
    }
}
