//
//  GithubUserDetailResponse.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/18.
//

import Foundation

struct GithubUserDetailResponse: Decodable {
    let name: String
    let imageURL: String
    let fullName: String
    let followerCount: Int
    let followeeCount: Int

    enum CodingKeys: String, CodingKey {
        case name = "login"
        case imageURL = "avatar_url"
        case fullName = "name"
        case followerCount = "followers"
        case followeeCount = "following"
    }
}

extension GithubUserDetail {
    init(from data: GithubUserDetailResponse) {
        self.init(name: data.name,
                  imageURL: data.imageURL,
                  fullName: data.fullName,
                  followerCount: data.followerCount,
                  followeeCount: data.followeeCount)
    }
}
