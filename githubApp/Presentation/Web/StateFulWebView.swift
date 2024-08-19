//
//  StateFulWebView.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/18.
//

import SwiftUI
import ComposableArchitecture

struct StateFulWebView: View {
    var store: StoreOf<StateFulWebFeature>
    var body: some View {
        WebView(loadURL: store.dependencies.initialUrl)
            .navigationTitle(store.dependencies.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    StateFulWebView(store: Store(initialState: StateFulWebFeature.State(url: URL(string: "https://google.com")!,
                                                                        title: "Google"),
                                 reducer: { StateFulWebFeature() }))
}
