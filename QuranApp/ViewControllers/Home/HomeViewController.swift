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
    var categories: [CollectionRow] = [.reciters, .hadiths, .suras, .liveRadio, .quran, .podcasts]

    enum CollectionRow: String {
        case reciters, suras, hadiths, liveRadio, quran, podcasts
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self

    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ pCollectionView: UICollectionView, numberOfItemsInSection pSection: Int) -> Int {
        return categories.count
    }

    func collectionView(_ pCollectionView: UICollectionView, cellForItemAt pIndexPath: IndexPath) -> UICollectionViewCell {
        let cell = pCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: pIndexPath) as! HomeCollectionCell
        let categories = self.categories[pIndexPath.row].rawValue
        cell.categoryNameLabel.text = categories.qp_capitalizeFirstLetter
        return cell
    }
}

