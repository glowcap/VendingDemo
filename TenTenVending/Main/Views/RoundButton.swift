//
//  RoundButton.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/19.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import UIKit

@IBDesignable final class RoundButton: UIButton {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    updateCornerRadius()
  }
  
  @IBInspectable var rounded: Bool = false {
    didSet {
      updateCornerRadius()
    }
  }
  
  private func updateCornerRadius() {
    layer.cornerRadius = rounded ? frame.size.height / 2 : 0
  }
  
}
