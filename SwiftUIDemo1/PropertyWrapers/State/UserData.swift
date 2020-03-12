//
//  UserData.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 04/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import Foundation
import SwiftUI

struct UserData {
     var name = ""
     var email = ""
}


struct UserDataView:View {
    
    @State var data = UserData()
    var body: some View{
        
        VStack{
            Text("Property wraper @state Example")
                .font(.largeTitle)
                .fontWeight(.bold)
            VStack(alignment: .leading,spacing: 30){
                       VStack(spacing:15){
                           TextField("Enter your name", text: $data.name)
                           TextField("Enter your email", text: $data.email)
                       }
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       Divider()
                       VStack(alignment: .leading,spacing: 15){
                           Text("Name: \(data.name)")
                           Text("Email: \(data.email)")
                       }
                   
                   }
               .padding()
            .cornerRadius(12)
            .border(Color.red)
          
        }
    .padding()
    
    
        
    }
}
