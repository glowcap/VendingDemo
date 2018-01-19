//
//  ViewController.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/19.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  var drinks = [Drink]()

  @IBOutlet weak var vendingCollection: UICollectionView!
  @IBOutlet weak var collectionHeight: NSLayoutConstraint!
  @IBOutlet weak var pointDisplay: NSLayoutConstraint!
  @IBOutlet weak var cashDisplay: UILabel!
  @IBOutlet weak var pointButton: RoundButton!
  @IBOutlet weak var cashButton: RoundButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    vendingCollection.delegate   = self
    vendingCollection.dataSource = self
    
    drinks = dummyDrinks
    vendingCollection.reloadData()
  }

  @IBAction func pointBtnTapped(_ sender: UIButton) {
  }
  
  @IBAction func cashBtnTapped(_ sender: UIButton) {
  }
  
}

