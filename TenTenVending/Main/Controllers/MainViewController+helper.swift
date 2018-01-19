//
//  MainViewController+helper.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/19.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import UIKit

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  /// DataSource functions
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VendingCell.id, for: indexPath) as? VendingCell else {
      return VendingCell()
    }
    
    cell.model = drinks[indexPath.row]
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return drinks.count
  }
  
  /// Delegate functions
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    layout.sectionInset = .zero
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    layout.invalidateLayout()
    return CGSize(width: collectionView.bounds.width / 5, height: collectionView.bounds.height / 3)
  }
  
}

