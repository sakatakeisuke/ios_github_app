//
//  UserDetailRepositoryView.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/18.
//

import SwiftUI

struct UserDetailRepositoryView: View {
    let repo: GithubRepository
    
    var body: some View {
        VStack {
            HStack {
                Text(repo.name)
                    .font(.title)
                    .fontWeight(.bold)
                Text(repo.usedLanguage)
                HStack {
                    Image(systemName: "star.circle")
                    Text("×\(repo.starCount)")
                        .padding(.init(top: 0, leading: -10, bottom: 0, trailing: 0))
                }
                Spacer()
            }
            .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 0))
            HStack {
                Text(repo.description)
                    .padding(.init(top: 0, leading: 40, bottom: 0, trailing: 0))
                    .foregroundStyle(Color.gray)
                Spacer()
            }
        }
    }
}

#Preview {
    UserDetailRepositoryView(repo: .init(id: 1, name: "repo1",
                                         usedLanguage: "swift",
                                         starCount: 100,
                                         description: "This is Sample Repository XXXXXXXXXXXXXX", 
                                         transitionURL: "https://github.com/sakatakeisuke/ios_github_app"))
}
