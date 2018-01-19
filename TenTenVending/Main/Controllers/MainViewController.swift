//
//  ViewController.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/19.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  enum PaymentType {
    case cash
    case points
  }
  
  var user: User! {
    didSet {
      updateDisplays()
    }
  }
  
  var items = [Drink]()
  var itemToPurchasePosition: IndexPath!

  @IBOutlet weak var vendingCollection: UICollectionView!
  @IBOutlet weak var collectionHeight: NSLayoutConstraint!
  @IBOutlet weak var pointDisplay: UILabel!
  @IBOutlet weak var cashDisplay: UILabel!
  @IBOutlet weak var pointButton: RoundButton!
  @IBOutlet weak var cashButton: RoundButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    vendingCollection.delegate   = self
    vendingCollection.dataSource = self
    
    user  = dummyUser
    items = dummyDrinks
    vendingCollection.reloadData()
  }
  
  private func updateDisplays() {
    pointDisplay.text = String(describing: user.points)
    cashDisplay.text = String(describing: user.cash)
  }

  @IBAction func pointBtnTapped(_ sender: UIButton) {
    guard itemToPurchasePosition != nil
    else { return }
    let price = items[itemToPurchasePosition.row].price
    if user.points < price {
      print("throw error")
    } else {
      buyItem(with: .points, price: price)
    }
  }
  
  @IBAction func cashBtnTapped(_ sender: UIButton) {
    guard itemToPurchasePosition != nil
      else { return }
    let price = items[itemToPurchasePosition.row].price
    if user.cash < price {
      print("throw error")
    } else {
      buyItem(with: .cash, price: price)
    }
  }
  
  private func buyItem(with payType: PaymentType, price: Int) {
    if payType == .cash {
      user.cash -= price
    } else {
      user.points -= price
    }
    updateDisplays()
    purchaseSelection()
  }
  
  private func purchaseSelection() {
    guard let cell = vendingCollection.cellForItem(at: itemToPurchasePosition) as? VendingCell else { return }
    cell.vendSelection()
    itemToPurchasePosition = nil
  }
  
}

