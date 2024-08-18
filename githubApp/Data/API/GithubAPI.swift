//
//  GithubAPI.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/18.
//

import Foundation

enum GithubAPI {
    private var baseURL: String { "https://api.github.com" }
    private var token: String { "" }
    
    case users(word: String)
    case user(name: String)
    case repos(userName: String)
    
    var endPoint: String {
        return switch self {
        case .users: "/search/users"
        case .user(let name): "/users/\(name)"
        case .repos(let userName): "/users/\(userName)/repos"
        }
    }
    
    var query: [URLQueryItem] {
        return switch self {
        case .users(let word): [.init(name: "q", value: word)]
        case .user, .repos: []
        }
    }
    
    var request: URLRequest {
        var component = URLComponents(string: baseURL + endPoint)!
        component.queryItems = query
        var req = URLRequest(url: component.url!)
        req.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        return req
    }
}

struct GithubUsersAPI: APIRequest {
    typealias Response = GithubUsersResponse
    private let searchWord: String
    var request: URLRequest { GithubAPI.users(word: searchWord).request }
    // 必ず検索文字列がないといけないので仮でaを設定
    init(searchWord: String = "a") {
        self.searchWord = searchWord
    }
}

struct GithubUserAPI: APIRequest {
    init(userName: String) {
        self.userName = userName
    }
    typealias Response = GithubUserDetailResponse
    private let userName: String
    var request: URLRequest { GithubAPI.user(name: userName).request }
}

struct GithubRepoAPI: APIRequest {
    init(userName: String) {
        self.userName = userName
    }
    typealias Response = [GithubRepositoryResponse]
    private let userName: String
    var request: URLRequest { GithubAPI.repos(userName: userName).request }
}
