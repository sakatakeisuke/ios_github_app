//
//  StateFulWebFeature.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/18.
//

import Foundation
import ComposableArchitecture

@Reducer
struct StateFulWebFeature {
    
    struct Dependencies {
        let initialUrl: URL
        let title: String
    }
    
    @ObservableState
    struct State {
        init(url: URL, title: String) {
            self.dependencies = Dependencies(initialUrl: url, title: title)
        }
        let dependencies: Dependencies
    }
    
    enum Action {}
    
    var Reducer: some Reducer<State, Action> {
        Reduce { _, _ in
            return .none
        }
    }
}
