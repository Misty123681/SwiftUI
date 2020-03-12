//
//  LandmarkList.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 03/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI
import Combine


struct favButton: View {
    
    @Binding var isOnSwitch: Bool
    
    var body: some View {
        Toggle(isOn: $isOnSwitch) {
            Text("My favorite places")
            
        }
    }
}

struct LandmarkList: View {
    
    //@State var showFavoritesOnly = false
    @EnvironmentObject var userinfo : UserInfo
    
    var body: some View {
        
        List{
            favButton(isOnSwitch: $userinfo.showFavoritesOnly)
            ForEach(self.userinfo.landmarks) { landmark  in
                
                if !self.userinfo.showFavoritesOnly || landmark.favorite ?? false{
                    NavigationLink(destination: LandmarkDetail(landmark: landmark).environmentObject(self.userinfo)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
            
        .navigationBarTitle("Landmark List",displayMode: .inline)
    }
    
    
}


