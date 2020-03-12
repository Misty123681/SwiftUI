//
//  Quote.swift
//  QuotesApp-New-XC11
//
//  Created by Paulo Dichone on 10/1/19.
//  Copyright © 2019 Paulo Dichone. All rights reserved.
//

import Foundation

import SwiftUI


struct Quote : Decodable,Identifiable {
    var id:String{
        return UUID().uuidString
    }
    
    var quote: String
    var name: String
}
