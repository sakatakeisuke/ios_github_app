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
                      userImageURL: "https://avatars.githubusercontent.com/u/112773764?v=4"),
                .init(id: 2,
                      name: "sakatakeisuke2",
                      userImageURL: "https://avatars.githubusercontent.com/u/112773764?v=4"),
                .init(id: 3,
                      name: "sakatakeisuke3",
                      userImageURL: "https://avatars.githubusercontent.com/u/112773764?v=4")]
    }
}
