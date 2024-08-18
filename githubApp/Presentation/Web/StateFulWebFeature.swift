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
    }
    
    @ObservableState
    struct State {
        init(url: URL) {
            self.dependencies = Dependencies(initialUrl: url)
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
