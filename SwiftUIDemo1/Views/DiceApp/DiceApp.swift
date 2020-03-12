//
//  DiceApp.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 07/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI

struct DiceApp: View {
    @State var dice1 = Int.random(in: 1 ... 6)
    @State var dice2 = Int.random(in: 1 ... 6)
    
   
    var body: some View {
        
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("diceeLogo")
                Spacer()
                HStack(){
                    DiceView(n: dice1)
                    DiceView(n: dice2)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    self.dice1 = Int.random(in: 1 ... 6)
                    self.dice2 = Int.random(in: 1 ... 6)
                    print("Button Tapped")
                }) {
                    Text("Roll")
                        .padding(5)
                        .foregroundColor(.white)
                        .font(Font.system(size: 35, weight: .bold, design: .default))
                        .background(Color.red)
                    
                }
                .padding(.bottom, 20)
            }
            
            
        }
         .navigationBarTitle("Dice App",displayMode: .inline)
    }
}


struct DiceView:View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1.0, contentMode: .fit)
            .padding(.all)
    }
    
}
struct DiceApp_Previews: PreviewProvider {
    static var previews: some View {
        DiceApp()
    }
}
