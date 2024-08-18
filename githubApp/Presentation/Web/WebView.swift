//
//  WebView.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/18.
//

import SwiftUI
import WebKit
import ComposableArchitecture

struct WebView: UIViewRepresentable {
    let loadURL: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(.init(url: loadURL))
    }
}

#Preview {
    WebView(loadURL: .init(string: "https://google.com")!)
}
