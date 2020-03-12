//
//  QuakesModel.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 18/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//


import Foundation

struct Features: Decodable, Hashable,Identifiable {
    var properties: Properties
    var geometry: Geometry
    var id :String{
        return UUID().uuidString
    }
}

struct Properties: Decodable, Hashable {
    var mag: Double
    var place: String
    var time: Double
    var detail: String
    var title: String
    var ids: String
    
    
}
struct Geometry: Decodable, Hashable {
    var type: String
    var coordinates: [Double]
}

struct QuakeAPIList: Decodable {
    var features: [Features]
}




class QuakesManager:ObservableObject{
    
    @Published var quakeAPIList = QuakeAPIList(features: [])
    
    init() {
        fetchData()
    }
    
    func fetchData(){
        
        guard let url = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson")else{return}
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url){(data, response, error) in
            
            if error == nil{
                if let safeData = data{
                    let decoder = JSONDecoder()
                    do{
                        let result =  try decoder.decode(QuakeAPIList.self, from: safeData)
                        DispatchQueue.main.async {
                            self.quakeAPIList = result
                        }
                    }
                    catch{
                        print(error)
                    }
                }
            }
        }
        .resume()
    }
    
}
