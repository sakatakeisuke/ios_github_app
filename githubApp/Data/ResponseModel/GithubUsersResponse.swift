//
//  GithubUsersResponse.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/18.
//

import Foundation

struct GithubUsersResponse: Decodable {
    struct GithubUserResponse: Decodable {
        let id: Int
        let name: String
        let imageURL: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case name = "login"
            case imageURL = "avatar_url"
        }
    }
    let users: [GithubUserResponse]

    enum CodingKeys: String, CodingKey {
        case users = "items"
    }
}

extension GithubUser {
    init(from data: GithubUsersResponse.GithubUserResponse) {
        self.init(id: data.id, name: data.name, imageURL: data.imageURL)
    }
}
