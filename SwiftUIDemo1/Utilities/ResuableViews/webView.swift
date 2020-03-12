//
//  webView.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 07/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI
import WebKit

struct webView: UIViewRepresentable{

    let url:String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(url)
    }
   
}

extension WKWebView{
    func load(_ urlString: String?) {
        if let url = URL(string: urlString ?? ""){
            let req = URLRequest(url: url)
            load(req)
        }
    }
}

