//
//  UserData.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 13/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import Foundation
import Combine




final class UserInfo: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
