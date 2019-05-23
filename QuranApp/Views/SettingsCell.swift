//
//  SettingsCell.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 20/05/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    @IBOutlet weak var settingsImage: UIImageView!
    @IBOutlet weak var settingsLabel: UILabel!
    
    // Populate cell views
    
    func fillWith(label pLabel: String, font pFont: UIFont? = nil, image pImage: UIImage? = nil) {
        self.settingsLabel.text = pLabel
        self.settingsLabel.font = pFont
        self.settingsImage.image = pImage
    }
    
    // Center Setting label
    func centerLabel() {
        self.settingsLabel.qp_removeAndaddView()
        let horizonalConstraint = self.settingsLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        self.contentView.addConstraint(horizonalConstraint)
    }
    
    // Center an populate both download and streaming cells seperately
    
    func fillView(text pText: String) {
        self.centerLabel()
        self.fillWith(label: pText, font: UIFont.qp_avenirNextMedium)
    }
}
