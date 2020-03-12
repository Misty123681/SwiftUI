//
//  showAlert.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 10/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI

struct AlertView: View {
    
    @State private var showingAlert = false

    var body: some View {
        Button("Show Alert") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        }
    }
}
