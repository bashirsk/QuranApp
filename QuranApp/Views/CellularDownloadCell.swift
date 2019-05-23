//
//  CellularDownloadCell.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 21/05/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class CellularDownloadCell: UITableViewCell {
    
    var completion: ((Bool) -> Void)?
    
    @IBAction func downloadOverCellularTapped(_ pSender: UISwitch) {
        if let switchAction = self.completion {
            switchAction(pSender.isOn)
        }
    }
}
