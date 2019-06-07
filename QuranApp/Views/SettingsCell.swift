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
    
    // Create checkmark image and add it to the cell programmatically
    var checkMarkImage: UIImageView {
        let checkMark = UIImageView()
        checkMark.image = #imageLiteral(resourceName: "Tick")
        checkMark.translatesAutoresizingMaskIntoConstraints = false
        checkMark.contentMode = .scaleAspectFit
        contentView.addSubview(checkMark)
        checkMark.heightAnchor.constraint(equalToConstant: 19).isActive = true
        checkMark.widthAnchor.constraint(equalToConstant: 24).isActive = true
        checkMark.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        checkMark.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        return checkMark
    }
    
    // Populate cell views
    func fillWith(label pLabel: String, lines pNumberOfLines: Int = 1, font pFont: UIFont? = UIFont.qp_avenirNextRegular(), image pImage: UIImage? = nil) {
        settingsLabel.text = pLabel
        settingsLabel.font = pFont
        settingsImage.image = pImage
        settingsLabel.numberOfLines = pNumberOfLines
    }
    
    // Center Settings label
    func setUpConstraintsForSettingsLabel() {
        settingsLabel.qp_removeAndaddView()
        settingsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        settingsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
    }
    
    // Center and populate both download and streaming cells seperately
    func fillViewInAudioViewController(text pText: String) {
        setUpConstraintsForSettingsLabel()
        selectionStyle = .none
        fillWith(label: pText, font: UIFont.qp_avenirNextMedium)
    }
    
    // Populate Streaming description cell
    func setUpConstraints() {
        settingsLabel.qp_removeAndaddView()
        selectionStyle = .none
        settingsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        settingsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 2).isActive = true
        settingsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
    }
}
