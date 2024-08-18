//
//  UserView.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/17.
//

import SwiftUI

struct UserView: View {
    let user: GithubUser
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.imageURL), content: { image in
                image.resizable()
            }) {
                Image(systemName: "person")
            }
            .frame(width: 50, height: 50)
            .cornerRadius(25)
            .overlay {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 1)
                    .fill(.black)
            }
            Text(user.name)
        }
    }
}

#Preview {
    UserView(user: .init(id: 1, name: "sakatakeisuke", imageURL: "https://avatars.githubusercontent.com/u/112773764?v=4"))
}
