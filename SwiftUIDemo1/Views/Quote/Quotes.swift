//
//  Quotes.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 11/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI

struct Quotes: View {
    var body: some View {
        ZStack{
            Image("motivation_bg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("lilly")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2.0))
                    .padding(.top,80)
                
                Text("\(quoteData.count) Quotes available")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .italic()
                    .padding(.top,30)
                
                ScrollView(.horizontal, showsIndicators: true){
                    HStack{
                        ForEach(quoteData){ item in
                            QuoteItem(title:item.name,message:item.quote)
                        }
                    }
                    
                }.padding(.horizontal,4)
                Spacer()
            }
        }
    }
}


struct QuoteItem:View {
    let title: String
    let message: String
    var body:some View{
        VStack(spacing:25){
            
            Image("lilly")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 90, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2.0))
                .shadow(radius: 10)
            
            VStack(spacing:20){
                Text(message)
                    .font(.subheadline)
                Divider()
                HStack{
                    Text("By -")
                    Text("\(title)")
                        .font(Font.custom("Pacifico-Regular", size: 14))
                }
                
            }
            
        }.frame(width: 300, height: 300)
            .foregroundColor(.gray)
            .padding()
            .background(Color.white)
            .cornerRadius(13)
            .overlay(Rectangle().fill(LinearGradient(gradient:Gradient(colors: [Color.clear,Color.pink]),startPoint: .center, endPoint: .topLeading))
                .clipped()
                .shadow(radius: 8))
        
        
        
    }
}
