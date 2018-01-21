//
//  Drink.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/19.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import UIKit

struct Drink {
  
  let id: String
  let name: String
  let bottle: UIImage
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

let dummyDrinks = [
  Drink(id: "ck123", name: "Coca-Cola", bottle: #imageLiteral(resourceName: "Coke"), price: 160, isCold: true, position: 0, quantity: 1),
  Drink(id: "gr123", name: "Grapetastic",bottle: #imageLiteral(resourceName: "Grape"), price: 160, isCold: true, position: 1, quantity: 10),
  Drink(id: "en123", name: "Pokkari Aide",bottle: #imageLiteral(resourceName: "EnergyDrink"), price: 160, isCold: true, position: 2, quantity: 10),
  Drink(id: "pk123", name: "Pinktacular",bottle: #imageLiteral(resourceName: "Pinky"), price: 160, isCold: true, position: 3, quantity: 10),
  Drink(id: "fn123", name: "Orange Fanta",bottle: #imageLiteral(resourceName: "Fanta"), price: 160, isCold: true, position: 4, quantity: 10),

  Drink(id: "gr123", name: "Grapetastic",bottle: #imageLiteral(resourceName: "Grape"), price: 160, isCold: true, position: 5, quantity: 10),
  Drink(id: "fn123", name: "Orange Fanta",bottle: #imageLiteral(resourceName: "Fanta"), price: 160, isCold: true, position: 6, quantity: 10),
  Drink(id: "en123", name: "Pokkari Aide",bottle: #imageLiteral(resourceName: "EnergyDrink"), price: 160, isCold: true, position: 7, quantity: 10),
  Drink(id: "ck123", name: "Coca-Cola",bottle: #imageLiteral(resourceName: "Coke"), price: 160, isCold: true, position: 8, quantity: 10),
  Drink(id: "pk123", name: "Pinktacular",bottle: #imageLiteral(resourceName: "Pinky"), price: 160, isCold: true, position: 9, quantity: 10),
  
  Drink(id: "cf123", name: "Coughee",bottle: #imageLiteral(resourceName: "Coffee"), price: 100, isCold: false, position: 10, quantity: 10),
  Drink(id: "cf123", name: "Coughee",bottle: #imageLiteral(resourceName: "Coffee"), price: 100, isCold: false, position: 11, quantity: 10),
  Drink(id: "cf123", name: "Coughee",bottle: #imageLiteral(resourceName: "Coffee"), price: 100, isCold: false, position: 12, quantity: 10),
  Drink(id: "cf123", name: "Coughee",bottle: #imageLiteral(resourceName: "Coffee"), price: 100, isCold: false, position: 13, quantity: 0),
  Drink(id: "cf123", name: "Coughee",bottle: #imageLiteral(resourceName: "Coffee"), price: 100, isCold: false, position: 14, quantity: 10)
]
