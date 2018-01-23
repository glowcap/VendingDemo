//
//  ViewController.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/19.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, AnimationEngine, WarningProtocol {
  
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
  var longPressForDetails: UILongPressGestureRecognizer!
  var blockerView: UIView!
  var detailView: DetailView!

  @IBOutlet weak var vendingCollection: UICollectionView!
  @IBOutlet weak var collectionHeight: NSLayoutConstraint!
  @IBOutlet weak var pointDisplay: FundsLabel!
  @IBOutlet weak var cashDisplay: FundsLabel!
  @IBOutlet weak var pointButton: RoundButton!
  @IBOutlet weak var cashButton: RoundButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureNavBar()
    vendingCollection.delegate   = self
    vendingCollection.dataSource = self
    
    user  = dummyUser
    items = dummyDrinks
    
    vendingCollection.reloadData()
    configureLongPressForDetails()
  }
  
  private func configureNavBar() {
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 28))
    imageView.contentMode = .scaleAspectFit
    let image = #imageLiteral(resourceName: "LogoSmall")
    imageView.image = image
    navigationItem.titleView = imageView
  }
  
  private func updateDisplays() {
    pointDisplay.text = String(describing: user.points)
    cashDisplay.text = String(describing: user.cash)
  }
  
  private func configureLongPressForDetails() {
    longPressForDetails = UILongPressGestureRecognizer(target: self, action: #selector(getItemDetails(gesture:)))
    vendingCollection.addGestureRecognizer(longPressForDetails)
  }
  
  @objc private func getItemDetails(gesture: UILongPressGestureRecognizer) {
    if gesture.state != .began { return }
    let location = gesture.location(in: vendingCollection)
    
    guard let indexPath = vendingCollection.indexPathForItem(at: location),
    let cell = vendingCollection.cellForItem(at: indexPath)
    else { return }
    let center = cell.center
    let item = items[indexPath.row]
    
    animateDetailsIntoView(item: item, from: center)
  }
  
  private func animateDetailsIntoView(item: Drink, from location: CGPoint) {
    guard detailView == nil else { return }
    displayBlockerView()
    springInDetailsAbout(item, from: location)
    
//    detailView = DetailView(item: item,
//                            frame: CGRect(x: screenWidth / 2 - DetailView.size.width / 2,
//                                          y: screenHeight / 2 - DetailView.size.height / 2,
//                                          width: DetailView.size.width,
//                                          height: DetailView.size.height))
//    detailView.delegate = self
//    detailView.alpha = 0
//    view.addSubview(detailView)
//    fadeIn(detailView)
  }
  
  private func displayBlockerView() {
    blockerView = UIView(frame: UIScreen.main.bounds)
    blockerView.backgroundColor = .black
    blockerView.alpha = 0
    view.insertSubview(blockerView, aboveSubview: vendingCollection)
    for v in view.subviews {
      v.isUserInteractionEnabled = false
    }
    fadeIn(blockerView, to: 0.7)
  }
  
  private func springInDetailsAbout(_ item: Drink, from location: CGPoint) {
    detailView = DetailView(item: item, frame: CGRect(x: location.x,
                                                     y: location.y,
                                                     width: DetailView.size.width,
                                                     height: DetailView.size.height))
    detailView.delegate = self
    view.addSubview(detailView)
    detailView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
    fadeIn(detailView)
    detailView.springIntoViewFrom(location: location)
    
  }
  
  private func displayDetailView(item: Drink, at location: CGPoint) {
    if detailView != nil {
      detailView.removeFromSuperview()
    }
    //    detailView = UIView(frame: CGRect(x: center.x, y: center.y, width: 20, height: 20))
    
    detailView = DetailView(item: item,
                            frame: CGRect(x: screenWidth / 2 - DetailView.size.width / 2,
                                          y: screenHeight / 2 - DetailView.size.height / 2,
                                          width: DetailView.size.width,
                                          height: DetailView.size.height))
    detailView.delegate = self
    view.addSubview(detailView)
  }

  @IBAction func pointBtnTapped(_ sender: RoundButton) {
    guard itemToPurchasePosition != nil,
          items[itemToPurchasePosition.row].quantity > 0
    else { return }
    let price = items[itemToPurchasePosition.row].price
    if user.points < price {
      warning(.insufficientPoints)
    } else {
      sender.springToLarge()
      buyItem(with: .points, price: price)
    }
  }
  
  @IBAction func cashBtnTapped(_ sender: RoundButton) {
    guard itemToPurchasePosition != nil,
          items[itemToPurchasePosition.row].quantity > 0
      else { return }
    let price = items[itemToPurchasePosition.row].price
    if user.cash < price {
      warning(.insufficientFunds)
    } else {
      sender.springToLarge()
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
    items[itemToPurchasePosition.row].quantity -= 1
    cell.model = items[itemToPurchasePosition.row]
    itemToPurchasePosition = nil
  }
  
}

extension MainViewController: DetailViewDelegate {
  
  func viewDidClose(sender: DetailView) {
    fadeOut(detailView) { [unowned self] _, complete in
      guard complete else { return }
      self.detailView.removeFromSuperview()
      self.detailView = nil
      for v in self.view.subviews {
        v.isUserInteractionEnabled = true
      }
    }

    fadeOut(blockerView) { [unowned self] _, completed in
      guard completed else { return }
      self.blockerView.removeFromSuperview()
      self.blockerView = nil
    }
  }
  
}

