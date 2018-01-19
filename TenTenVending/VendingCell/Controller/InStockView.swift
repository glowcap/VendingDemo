//
//  InStockView.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/19.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import UIKit

class InStockView: UIView {

    override func draw(_ rect: CGRect) {
      layer.cornerRadius = rect.height / 2
      layer.masksToBounds = true
    }
  

}
