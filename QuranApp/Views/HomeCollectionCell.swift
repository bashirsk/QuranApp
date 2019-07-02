//
//  HomeCollectionCell.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 02/07/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class HomeCollectionCell: UICollectionViewCell {

    @IBOutlet weak var categoryNameLabel: UILabel!

    override func awakeFromNib() {
        qp_addRoundRectBorderWithColour(.black, width: 1.0, radius: 10.0)
    }
}
