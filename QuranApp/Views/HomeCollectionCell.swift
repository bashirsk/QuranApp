//
//  HomeCollectionCell.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 24/07/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class HomeCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    var category: Category! {
        didSet {
            categoryNameLabel.text = category.categoryName
            categoryImageView.image = UIImage(named: category.categoryImage)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImageView.qp_addCornerRadius(10)
    }    
}
