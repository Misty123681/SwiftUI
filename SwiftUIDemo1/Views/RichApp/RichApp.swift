//
//  RichApp.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 07/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI

struct RichApp: View {
     @State private var scale: CGFloat = 1
    @State private var toggle = false
    
    var body: some View {
        ZStack{
            Color(.systemTeal).edgesIgnoringSafeArea(.all)
            VStack{
                Text("I am rich")
                    .font(.title)
                    .foregroundColor(.white)
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150, alignment: .center)
                    .scaleEffect(toggle ? 2 : 1)
                    .animation(.linear(duration: 3))
                    .onTapGesture {
                        self.toggle.toggle()
                       
                   }
                AnimationDelay()
               
            }
            
        }
       .navigationBarTitle("Rich App",displayMode: .inline)
    }
}

struct RichApp_Previews: PreviewProvider {
    static var previews: some View {
        RichApp()
    }
}
