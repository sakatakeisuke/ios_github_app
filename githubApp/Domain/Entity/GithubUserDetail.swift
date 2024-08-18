//
//  GithubUserDetail.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/17.
//

import Foundation

struct GithubUserDetail: Equatable {
    let name: String
    let imageURL: String
    let fullName: String
    let followerCount: Int
    let followeeCount: Int
}
