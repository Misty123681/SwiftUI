//
//  LandmarkDetail.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 03/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @EnvironmentObject var userData: UserInfo
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        VStack{
            MapView(cordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            CircularImage(image: "location")
                .frame(width: 200, height: 200)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading){
                HStack {
                    Text(landmark.name)
                        .font(.subheadline)
                    
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex].favorite?.toggle()
                    }) {
                        if self.userData.landmarks[self.landmarkIndex].favorite ?? false {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                    
                }
                HStack{
                    Text(landmark.park).font(.subheadline)
                    Spacer()
                    Text(landmark.state).font(.subheadline)
                }
                
            }
                
            .padding()
            Spacer()
            .navigationBarTitle(Text(landmark.name), displayMode: .inline)
            
        }
        
        
    }
    
    
}
