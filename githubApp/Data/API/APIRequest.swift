//
//  APIRequest.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/18.
//

import Foundation

struct FatalError: Error {}

protocol APIRequest {
    associatedtype Response: Decodable
    var request: URLRequest { get }
}

extension APIRequest {
    func response() async throws -> Response {
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(Response.self, from: data)
    }
}
