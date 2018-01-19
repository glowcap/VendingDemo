//
//  User.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/19.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import Foundation

struct User {
  
  let id: String
  var cash: Int
  var points: Int
  var purchases = [Drink]()
  
  init(id: String, cash: Int, points: Int) {
    self.id     = id
    self.cash   = cash
    self.points = points
  }
  
}

let dummyUser = User(id: "1010", cash: 1214, points: 921)
