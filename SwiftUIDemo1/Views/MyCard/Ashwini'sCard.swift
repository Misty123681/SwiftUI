//
//  Ashwini'sCard.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 07/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI

struct Ashwini_sCard: View {
    
    var body: some View {
        ZStack{
            Color(UIColor(red:0.10, green:0.74, blue:0.61, alpha:1.0))
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("umbagog")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                
                Text("Ashwini Vishwas")
                    .foregroundColor(.white)
                    .font(Font.custom("Pacifico-Regular", size: 20.0))
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                Divider()

                profileField(name: "+91 9623013315", icon: "phone.fill")
                profileField(name: "ashwini.vishwas@neosofttech.com", icon: "envelope.fill")
                
            }
          
            
        }
         .navigationBarTitle("My card",displayMode: .inline)
    }
}

struct Ashwini_sCard_Previews: PreviewProvider {
    static var previews: some View {
        Ashwini_sCard()
    }
}


struct profileField:View {
    let name :String
    let icon: String
    var body: some View{
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 45, alignment: .center)
            .foregroundColor(Color.white)
            .padding(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 15))
            .overlay(HStack{
                Image(systemName: icon)
                    .foregroundColor(Color(UIColor(red:0.10, green:0.74, blue:0.61, alpha:1.0)))
                Text(name)
            })
    }
}




