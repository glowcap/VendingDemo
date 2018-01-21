//
//  DetailView.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/21.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import UIKit

protocol DetailViewDelegate: class {
  func viewDidClose(sender: DetailView)
}

class DetailView: UIView {
  
  static let size = CGSize(width: 320, height: 270)
  
  var delegate: DetailViewDelegate? = nil
  
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var bottle:      UIImageView!
  @IBOutlet weak var nameLbl:     UILabel!
  @IBOutlet weak var calorieLbl:  UILabel!
  @IBOutlet weak var fatLbl:      UILabel!
  @IBOutlet weak var sodiumLbl:   UILabel!
  @IBOutlet weak var carbsLbl:    UILabel!
  @IBOutlet weak var sugarsLbl:   UILabel!
  @IBOutlet weak var proteinLbl:  UILabel!
  
  convenience init(item: Drink, frame: CGRect) {
    self.init(frame: frame)
    configure()
    nameLbl.text = item.name
    bottle.image = item.bottle
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configure()
  }
  
  private func configure() {
    Bundle.main.loadNibNamed("DetailView", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    contentView.layer.cornerRadius = 4
    contentView.clipsToBounds = true
  }
  
  @IBAction func closeTapped() {
    guard delegate != nil else { return }
    delegate?.viewDidClose(sender: self)
  }
  
}
