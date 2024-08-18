read -p "github API token?: " token

echo """
//
//  Secure.swift
//  githubApp
//
//  Auto Created
//

import Foundation

struct Secure {
    static let token = \"{$token}\"
}
""" > ./githubApp/Secure.swift

echo "completed"
