//
//  QuakesList.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 14/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI
import UIKit

struct QuakesList: View {
    
    @ObservedObject private var quakes = QuakesManager()
    
    var body: some View {
        List{
            ForEach(quakes.quakeAPIList.features){ item in
                NavigationLink(destination: QuakesDetails()) {
                    QuakeRow(feature: item)
                }.navigationBarTitle("Navigation")
            }
        }
        
    }
}


struct QuakeRow: View {
    
    let feature:Features
    
    var body: some View {
        HStack{
            
            VStack(alignment: .leading){
                Text(String(feature.properties.mag))
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
            }
            .frame(width: 100, height: 100, alignment: .center)
            .background(Color.green)
                
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 1.0))
            .shadow(radius: 10)
            
            
            VStack(alignment: .leading, spacing: 10.0){
                Text(feature.properties.place)
                    .foregroundColor(.gray)
                Text(String(feature.properties.time))
                    .foregroundColor(.orange)
                    .font(.subheadline)
            }
        }
    }
}
