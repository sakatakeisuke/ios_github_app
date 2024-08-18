//
//  ContentView.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/16.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    var body: some View {
        UserListView(store: Store(initialState: UserListFeature.State()){
            UserListFeature()
        })
    }
}

#Preview {
    ContentView()
}
