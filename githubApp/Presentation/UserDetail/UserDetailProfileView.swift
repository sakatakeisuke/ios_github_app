//
//  UserDetailProfileView.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/18.
//

import SwiftUI

struct UserDetailProfileView: View {
    let userDetail: GIthubUserDetail?
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: userDetail?.imageURL ?? ""), content: { image in
                image.resizable()
            }) {
                Image(systemName: "person")
            }
            .frame(width: 100, height: 100)
            .cornerRadius(50)
            .overlay {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(lineWidth: 1)
                    .fill(.black)
            }
            VStack {
                Text(userDetail?.fullName ?? "-")
                Text(userDetail != nil ? "@\(userDetail!.name)" : "-")
                if let user = userDetail {
                    HStack {
                        Text("\(user.followeeCount) following")
                        Text("\(user.followerCount) follower")
                    }
                }
            }
        }
    }
}

#Preview {
    UserDetailProfileView(userDetail: .init(name: "sakatakeisuke",
                                            imageURL: "https://avatars.githubusercontent.com/u/112773764?v=4",
                                            fullName: "Keisuke_Sakata",
                                            followerCount: 3,
                                            followeeCount: 3))
}
