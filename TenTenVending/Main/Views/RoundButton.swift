//
//  RoundButton.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/19.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import UIKit
import pop

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
  
  func springToLarge() {
    guard let anim = POPSpringAnimation(propertyNamed: kPOPViewScaleXY) else { return }
    anim.velocity = NSValue(cgSize: CGSize(width: 2.5, height: 2.50))
    anim.toValue = NSValue(cgSize: CGSize(width: 1.0, height: 1.0))
    anim.springBounciness = 12.0
    self.pop_add(anim, forKey: "SpringToLargeAnimation")
  }
  
}
