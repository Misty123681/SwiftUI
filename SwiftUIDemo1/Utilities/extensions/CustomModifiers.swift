//
//  CustomModifiers.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 10/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.red, lineWidth: 2))
    }
}


extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct customTitle: View {
    var body: some View {
        Text("ashwini")
            .titleStyle()
        
    }
}




