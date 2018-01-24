//
//  Drink.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/19.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import UIKit

struct ResponseData: Decodable {
  var items: [Drink]
}

struct Drink: Codable {
  
  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case bottleName = "bottle_name"
    case price
    case isCold = "is_cold"
    case position
    case quantity
  }
  
  let id: String
  let name: String
  let bottleName: String
  let price: Int
  let isCold: Bool
  let position: Int
  var quantity: Int
  
}

extension Drink: Comparable {
  
  static func ==(lhs: Drink, rhs: Drink) -> Bool {
    return lhs.id == rhs.id
  }
  
  static func <(lhs: Drink, rhs: Drink) -> Bool {
    return lhs.position < rhs.position
  }
  
}

