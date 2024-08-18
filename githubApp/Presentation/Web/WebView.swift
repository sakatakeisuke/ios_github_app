//
//  WebView.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/18.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let loadURL: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = loadURL else { return }
        uiView.load(.init(url: url))
    }
}

#Preview {
    WebView(loadURL: .init(string: "https://google.com"))
}
