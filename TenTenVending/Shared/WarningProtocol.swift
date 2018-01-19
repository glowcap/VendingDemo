//
//  WarningProtocol.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/19.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import UIKit

enum WarningType {
  case insufficientFunds
  case insufficientPoints
}

protocol WarningProtocol: class {
  func warning(_ issue: WarningType)
}

extension WarningProtocol where Self: UIViewController {
  
  func warning(_ issue: WarningType) {
    var title: String
    var message: String
    
    if issue == .insufficientFunds {
      title = "Insufficient Funds"
      message = "Add more green cash to make a purchase"
    } else {
      title = "Insufficient Points"
      message = "Make more purchases with Green Cash to earn points."
    }
    
    let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default)
    ac.addAction(okAction)
    self.present(ac, animated: true, completion: nil)
  }
  
}
