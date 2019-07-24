//
//  HomeViewController.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 02/07/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private let cellId = "CategoriesCell"
    
    var categories: [Category] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        categories = Category.getCategories
    }
}

//MARK:- UIColleectionViewelegate

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ pCollectionView: UICollectionView, numberOfItemsInSection pSection: Int) -> Int {
        return categories.count
    }

    func collectionView(_ pCollectionView: UICollectionView, cellForItemAt pIndexPath: IndexPath) -> UICollectionViewCell {
        let cell = pCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: pIndexPath) as! HomeCollectionCell
        let categories = self.categories[pIndexPath.row]
        cell.category = categories
        return cell
    }
    
    func collectionView(_ pCollectionView: UICollectionView, layout pCollectionViewLayout: UICollectionViewLayout, sizeForItemAt pIndexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.size.width - 30.0) / 2.0
        return CGSize(width: width, height: width + 31)
    }
}
