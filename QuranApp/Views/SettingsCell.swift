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
    func fillWith(label pLabel: String, lines pNumberOfLines: Int = 1, font pFont: UIFont? = UIFont.qp_avenirNextRegular(), image pImage: UIImage? = nil) {
        self.settingsLabel.text = pLabel
        self.settingsLabel.font = pFont
        self.settingsImage.image = pImage
        self.settingsLabel.numberOfLines = pNumberOfLines
    }
    
    // Center Setting label
    func centerLabel() {
        self.settingsLabel.qp_removeAndaddView()
        let horizonalConstraint = self.settingsLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let topConstraint = self.settingsLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12)
        self.contentView.addConstraints([horizonalConstraint, topConstraint])
    }
    
    // Center an populate both download and streaming cells seperately
    func fillView(text pText: String) {
        self.centerLabel()
        self.selectionStyle = .none
        self.fillWith(label: pText, font: UIFont.qp_avenirNextMedium)
    }
    
    // Populate Streaming description cell
    func addConstraintsToLabel() {
        self.settingsLabel.qp_removeAndaddView()
        self.selectionStyle = .none
        let leadingConstraint = self.settingsLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let trailingConstraint = self.settingsLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 16)
        let topConstraint = self.settingsLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 14)
        self.contentView.addConstraints([leadingConstraint, trailingConstraint, topConstraint])
    }
}
