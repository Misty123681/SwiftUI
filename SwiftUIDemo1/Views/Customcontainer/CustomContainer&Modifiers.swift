//
//  CustomContainer&Modifiers.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 11/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI

struct CustomContainer_Modifiers: View {
    var body: some View {
        VStack{
            GridStack(rows: 4, columns: 4) { row, col in
                Image(systemName: "\(row * 4 + col).circle")
                Text("Hello")
            }
            Text("ashwini")
            .titleStyle()
        }
    }
}

struct CustomContainer_Modifiers_Previews: PreviewProvider {
    static var previews: some View {
        CustomContainer_Modifiers()
    }
}
