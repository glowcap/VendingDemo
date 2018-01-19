//
//  FundsLabel.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/19.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import UIKit

class FundsLabel: UILabel {

  override func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = 4
    clipsToBounds = true
  }

}
