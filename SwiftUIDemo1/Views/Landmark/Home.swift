//
//  Home.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 13/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//



import SwiftUI

struct CategoryHome: View {
    
    
    @State var showingProfile = false
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarkData,
            by: { $0.category.rawValue }
        )
    }
    
    var body: some View {
        
            List {
                FeaturedLandmarks()
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName:key,items:self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: LandmarkList().environmentObject(UserInfo())) {
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                SecondView()
            }
        
    }
}

struct FeaturedLandmarks: View {
      
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                Image("motivation_bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: w.width,height: 200)
                    .clipped()
                Image("paulos-nice-photo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: w.width,height: 200)
                    .clipped()
                
                Image("background")
                    .resizable()
                    .scaledToFill()
                    . frame(width: w.width,height: 200)
                    .clipped()
                
                Image("lilly")
                    .resizable()
                    .scaledToFill()
                    .frame(width: w.width,height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
            }
        }
        
        .listRowInsets(EdgeInsets())
    }
}



struct SecondView:View {
    @Environment(\.presentationMode) var  presentationMode
    var body:some View{
        Button("Dismiss"){
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}
