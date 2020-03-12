//
//  File.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 13/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
   
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { landmark in
                       //categoryItem(landmark:landmark)
                        NavigationLink(destination: LandmarkDetail(landmark: landmark).environmentObject(UserInfo())) {
                            categoryItem(landmark:landmark)
                        }
                        
               
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

