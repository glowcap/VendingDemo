//
//  ShadowedView.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/19.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import UIKit
@IBDesignable final class ShadowedView: UIView {
  
  @IBInspectable var outsideColor: UIColor = UIColor.red
  @IBInspectable var insideColor: UIColor = UIColor.green
  
  override func draw(_ rect: CGRect) {
    let colors = [insideColor.cgColor, outsideColor.cgColor] as CFArray
    let endRadius = sqrt(pow(frame.width/2, 2) + pow(frame.height/4, 2))
    let center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
    let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
    let context = UIGraphicsGetCurrentContext()
    
    context?.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.4, endCenter: center, endRadius: endRadius - 8, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
  }
  
}
