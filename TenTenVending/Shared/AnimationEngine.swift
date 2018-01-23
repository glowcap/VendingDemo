//
//  AnimationEngine.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/23.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import UIKit
import pop

protocol AnimationEngine: class {
  
  func fadeIn(_ view: UIView, to value: Double)
  func fadeOut(_ view: UIView, complete:@escaping (POPAnimation?, Bool)->())
  
}

extension AnimationEngine where Self: UIViewController {
  
  func fadeIn(_ view: UIView, to value: Double = 1.0) {
    guard let anim = POPBasicAnimation(propertyNamed: kPOPViewAlpha) else { return }
    anim.toValue = CGFloat(value)
    view.pop_add(anim, forKey: "FadeIn")
  }
  
  func fadeOut(_ view: UIView, complete:@escaping (POPAnimation?, Bool)->()) {
    guard let anim = POPBasicAnimation(propertyNamed: kPOPViewAlpha) else { return }
    anim.toValue = 0
    anim.completionBlock = complete
    view.pop_add(anim, forKey: "FadeOut")
  }
  
}
