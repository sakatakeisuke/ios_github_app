//
//  GithubRepositoryResponse.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/18.
//

import Foundation

struct GithubRepositoryResponse: Decodable {
    let id: Int
    let name: String
    let usedLanguage: String?
    let starCount: Int
    let description: String?
    let transitionURL: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case usedLanguage = "language"
        case starCount = "stargazers_count"
        case description = "description"
        case transitionURL = "html_url"
    }
}

extension GithubRepository {
    init(from data: GithubRepositoryResponse) {
        self.init(id: data.id,
                  name: data.name,
                  usedLanguage: data.usedLanguage ?? "-",
                  starCount: data.starCount,
                  description: data.description ?? "",
                  transitionURL: data.transitionURL)
    }
}
