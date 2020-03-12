//
//  ServiceManager.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 07/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import Foundation

struct Result:Decodable {
    let hits:[Post]
}

struct Post:Decodable,Identifiable {
    let title:String
    let url:String?
    let objectID:String
    let points:Int
    var id:String{
        return objectID
    }
}




class ServiceManager:ObservableObject{
   
    init() {
      fetchData()
    }
    
    @Published var posts = [Post]()
    
    func fetchData(){
        
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page")else{return}
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url){(data, response, error) in
          
            if error == nil{
                if let safeData = data{
                    let decoder = JSONDecoder()
                    do{
                        let result =  try decoder.decode(Result.self, from: safeData).hits
                        DispatchQueue.main.async {
                            self.posts = result
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
