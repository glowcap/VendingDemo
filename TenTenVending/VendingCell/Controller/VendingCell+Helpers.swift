//
//  VendingCell+Helpers.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/19.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import UIKit
import pop

extension VendingCell {
  
  func vendSelection() {
    guard let m = model else { return }
    inStockView.backgroundColor = m.quantity > 0 ? #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) : #colorLiteral(red: 0.9215686275, green: 0.08235294118, blue: 0.08235294118, alpha: 1)
    animateBottleTo(100, duration: 0.2)
    guard let anim = POPBasicAnimation(propertyNamed: kPOPLayoutConstraintConstant) else { return }
    anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    anim.duration = 0.2
    anim.toValue = 100
    bottleYPos.pop_add(anim, forKey: "Vend")
    
    after(delay: 0.8) { [unowned self] in
      self.bottleYPos.constant = -150
      self.animateBottleTo(self.bottleDefaultYPos, duration: 0.5)
    }
  }
  
  private func animateBottleTo(_ yPos: CGFloat, duration: CGFloat) {
    guard let anim = POPBasicAnimation(propertyNamed: kPOPLayoutConstraintConstant) else { return }
    anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    anim.duration = CFTimeInterval(duration)
    anim.toValue = yPos
    bottleYPos.pop_add(anim, forKey: "Vend")
  }
  
}
