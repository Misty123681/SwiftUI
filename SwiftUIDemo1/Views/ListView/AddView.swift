//
//  AddView.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 13/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import Foundation
import SwiftUI





struct Pokemon: Identifiable {
    var id = UUID()
    let name: String
    let type: String
    let color: Color
}


//Pokemon(id: UUID(), name: "Charmander", type: "Fire", color: .red),
//           Pokemon(id: UUID(), name: "Squirtle", type: "Water", color: .blue),
//           Pokemon(id: UUID(), name: "Bulbasaur", type: "Grass", color: .green),
//           Pokemon(id: UUID(), name: "Pikachu", type: "Electric", color: .yellow),



struct AddView: View {
    
    @State private var name = ""
    @State private var type = "Fire"
    @State private var amount = ""
    @State private var color = Color.red
    @State private var showingAlert = false
    
    @ObservedObject var pokemans: iPokeman
    @Environment(\.presentationMode) var  presentationMode
    
    
    let pokemanType = ["Fire","Water","Grass","Electric"]
    let pokemanClr = [Color.red,Color.blue,Color.green,Color.yellow]
    
    
    var body: some View {
        return NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(pokemanType, id: \.self) {
                        Text($0)
                    }
                }
                Picker("Color", selection: $color) {
                    ForEach(pokemanClr, id: \.self) {
                        $0
                    }
                }
                
            }
            .alert(isPresented: $showingAlert){Alert(title: Text("Alert"), message: Text("Name can't be empty"), dismissButton: .default(Text("Ok")))
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("save"){
                let item = Pokemon(name: self.name, type: self.type,color: self.color)
                if self.$name.wrappedValue.isEmpty{
                    self.showingAlert.toggle()
                    return
                }
                
                self.pokemans.arrPokeman.append(item)
                self.presentationMode.wrappedValue.dismiss()
                
            })
        }
    }
}
