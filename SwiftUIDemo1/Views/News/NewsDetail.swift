//
//  NewsDetail.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 07/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI

struct NewsDetail: View {
    let url:String?
    var body: some View {
        webView(url: url)
    }
}

struct NewsDetail_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetail(url: "")
    }
}
