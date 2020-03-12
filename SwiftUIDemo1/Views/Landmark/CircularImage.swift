//
//  CircularImage.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 03/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI
//import UIKit

struct CircularImage: View {
    let image:String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            //.aspectRatio(1.0, contentMode: .fit)
            //.frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 10)
    }
}

