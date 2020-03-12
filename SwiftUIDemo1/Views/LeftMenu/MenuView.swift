//MenuView.swift

//Created by BLCKBIRDS on 26.10.19.
//Visit www.BLCKBIRDS.com for more.

import SwiftUI

struct MenuView: View {
    var body: some View {
        
        VStack(alignment: .leading,spacing: 20) {
            
            Group{
                
                NavigationLink(destination: CategoryHome()) {
                    
                    Text("Landmark List")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                
                NavigationLink(destination: RichApp()) {
                    Text("Rich App")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                
                NavigationLink(destination: Ashwini_sCard()) {
                    Text("My Card")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                
                
                NavigationLink(destination: DiceApp()) {
                    Text("Dice App")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                
                NavigationLink(destination: HackerNews()) {
                    Text("Hacker News")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
            }
            Group{
                
                NavigationLink(destination: CustomContainer_Modifiers()) {
                    Text("Custom Views")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                
                NavigationLink(destination: BusinessCard()) {
                    Text("Business Card")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                NavigationLink(destination: Animations()) {
                    Text("Animation")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                
                
                NavigationLink(destination: Gestures()) {
                    Text("Gestures")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                
                NavigationLink(destination: Quotes()) {
                    Text("Quotes")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                NavigationLink(destination: PokemanListView()) {
                    Text("Pokeman list")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                NavigationLink(destination: QuakesList()) {
                    Text("Quakes")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
               
            }
            
            
            Spacer()
        }
        .padding(.top, 100)
        .padding(.leading, 15)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
