//
//  LandmarkRow.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 03/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    
    let landmark: Landmark
    
    var body: some View {
        HStack{
           Image("umbagog")
            .resizable()
            .frame(width: 90, height: 90)
            .clipShape(Circle())
            Text(landmark.name)
            Spacer()

        if landmark.favorite ?? false{
            Image(systemName: "star.fill")
            .foregroundColor(Color.green)
        }
        
        }
    }
}

struct categoryItem: View {
    
    let landmark: Landmark
    
    var body: some View {
        VStack{
           Image("umbagog")
            .resizable()
            .renderingMode(.original)
            .frame(width: 100, height: 100)
             .cornerRadius(5)
            Text(landmark.name)
                 .font(.caption)
                .foregroundColor(.black)
        }
    .padding(.leading, 15)
    }
}





