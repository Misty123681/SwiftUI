//
//  ContentView.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 03/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//
import SwiftUI
import Crashlytics


struct ContentView: View {
    
    var body: some View {
        LeftMenu()
        ///QuakesList()
        
    }
}


struct LeftMenu:View {
    
    @State var showMenu = false
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
        }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
            }
            .navigationBarTitle("Side Menu", displayMode: .inline)
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
            ))
        }
    }
}


struct MainView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.showMenu = true
               // assert(false)
                 //Crashlytics.sharedInstance().crash()
            }
        }) {
            Text("Show Menu")
        }
    }
}




