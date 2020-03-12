//
//  BusinessCard.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 11/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI
let w = UIScreen.main.bounds.size

struct BusinessCard: View {
    var body: some View {
        HStack{
            CircularImage(image: "paulos-nice-photo")
              
            VStack{
                Text("Paulo Dichone")
                    .foregroundColor(.white)
                    .font(.title)
                    .lineLimit(1)
                Text(" buildappswithpaulo.com ")
                    .foregroundColor(.white)
                    .font(.subheadline)
                HStack{
                    Image(systemName: "t.square.fill")
                        .foregroundColor(.pink)
                    
                    Text(": @buildappswithme")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                        .bold()
                        .italic()
                    
                }
            }
        }
        .frame(width: w.width - 40, height: (w.width*0.50) - 30)
        .background(Color.orange)
        .cornerRadius(8)
        .shadow(radius: 5)
            
        .navigationBarTitle("Business card",displayMode: .inline)
        
    }
     
}

struct BusinessCard_Previews: PreviewProvider {
    static var previews: some View {
        BusinessCard()
    }
}
