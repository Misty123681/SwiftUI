//
//  DynamicListView.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 12/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI


class iPokeman: ObservableObject {
    
    @Published var arrPokeman = [
        Pokemon(id: UUID(), name: "Squirtle", type: "Water", color: .blue),
        Pokemon(id: UUID(), name: "Bulbasaur", type: "Grass", color: .green)]
}


struct PokemanListView: View {
    
    @ObservedObject var pokemans = iPokeman()
    @State var showingAddView = false
    
    var body: some View {
        
        List{
            ForEach(pokemans.arrPokeman){ item in
                HStack{
                    Text(item.name)
                    Text(item.type).foregroundColor(item.color)
                }
            }.onDelete(perform: removeRows)
        }
        .sheet(isPresented: $showingAddView) {
            AddView(pokemans: self.pokemans)
        }
        .navigationBarTitle("Pokeman")
        .navigationBarItems(trailing:
            HStack{
                Button(action: addItem,
                       label:{Text("+")})
                EditButton()
                
            }
            
        )
    }
    
    func removeRows(at offsets: IndexSet) {
        pokemans.arrPokeman.remove(atOffsets: offsets)
    }
    
    
    func addItem(){
        
        showingAddView.toggle()
        //        if var pokeman = pokemans.arrPokeman.randomElement(){
        //            pokeman.id = UUID()
        //            pokemans.arrPokeman.append(pokeman)
        //        }
        
    }
}




