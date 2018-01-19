//
//  VendingCell.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/19.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import UIKit

class VendingCell: UICollectionViewCell {
  
  static let id = "VendingCell"
  
  var bottleDefaultYPos: CGFloat!
  var itemSelected = false {
    didSet {
      guard let m = model,
                m.quantity > 0 else { return }
      inStockView.backgroundColor = itemSelected ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : #colorLiteral(red: 0.2549019608, green: 0.2745098039, blue: 0.3019607843, alpha: 1)
    }
  }
  
  @IBOutlet weak var bottleYPos: NSLayoutConstraint!
  
  @IBOutlet weak var bottle: UIImageView!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var inStockView: InStockView!
  
  var model: Drink? {
    didSet {
      guard let m = model else { return }
      configure(model: m)
    }
  }
  
  private func configure(model: Drink) {
    bottleDefaultYPos = bottleYPos.constant
    bottle.image = model.bottle
    priceLabel.text = String(describing: model.price)
    priceLabel.backgroundColor = model.isCold ? #colorLiteral(red: 0.01960784314, green: 0.5725490196, blue: 0.9411764706, alpha: 1) : #colorLiteral(red: 0.9215686275, green: 0.08235294118, blue: 0.08235294118, alpha: 1)
    inStockView.backgroundColor = model.quantity > 0 ? #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) : #colorLiteral(red: 0.9215686275, green: 0.08235294118, blue: 0.08235294118, alpha: 1)
  }
  
}
