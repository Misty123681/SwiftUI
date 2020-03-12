//
//  HackerNews.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 07/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI

struct HackerNews: View {
    
    @ObservedObject var manager = ServiceManager()
    
    var body: some View {
       
            List(manager.posts){ post in
                NavigationLink(destination:NewsDetail(url: post.url)) {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("Hacker News")
        
        .onAppear {
           // self.manager.fetchData()
        }
         .navigationBarTitle("News details",displayMode: .inline)
    }
    
    
}



struct HackerNews_Previews: PreviewProvider {
    static var previews: some View {
        HackerNews()
    }
}


