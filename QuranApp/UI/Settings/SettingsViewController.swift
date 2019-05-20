//
//  SettingsViewController.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 20/05/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class SettingsViewController: BaseViewController {
    
    // Might change it later
    enum cellIdentifiers {
        case settingsCell, cellularDownloadCell
        
        var description: String {
            switch self {
            case .settingsCell:
                return "SettingsCell"
            case .cellularDownloadCell:
                return "CellularDownloadCell"
            }
        }
    }
    
    enum TableRow {
        case audioQuality, cellularDownload, aboutUs, shareApp, rateUs, contactUs
    }
    
    var tableRows: [TableRow] = [.audioQuality, .cellularDownload, .aboutUs, .shareApp, .rateUs, .contactUs]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var tableViewArray: [[Any]] {
        return [self.tableRows]
    }
    
    func objectForIndexPath(indexPath pIndexpath: IndexPath) -> TableRow {
        return itemForIndexPath(indexPath: pIndexpath) as! TableRow
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource

extension SettingsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableRows.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt pIndexPath: IndexPath) -> UITableViewCell {
        let rowObject = self.objectForIndexPath(indexPath: pIndexPath)
        switch rowObject {
        case .cellularDownload:
            return self.cellularDownloadCell(indexPath: pIndexPath)
        default:
            return self.entryCell(indexPath: pIndexPath, rowObject)
        }
    }
    
    private func entryCell(indexPath pIndexPath: IndexPath, _ pRow: TableRow) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: cellIdentifiers.settingsCell.description, for: pIndexPath) as! SettingsCell
        switch pRow {
        case .audioQuality:
            cell.settingsLabel.text = "Audio Quality"
            cell.settingsImage.image = #imageLiteral(resourceName: "AudioQuality")
        case .aboutUs:
            cell.settingsLabel.text = "About us"
            cell.settingsImage.image = #imageLiteral(resourceName: "AboutUs")
        case .shareApp:
            cell.settingsLabel.text = "Share app"
            cell.settingsImage.image = #imageLiteral(resourceName: "Share")
        case .rateUs:
            cell.settingsLabel.text = "Rate us"
            cell.settingsImage.image = #imageLiteral(resourceName: "RateUs")
        case .contactUs:
            cell.settingsLabel.text = "Contact us"
            cell.settingsImage.image = #imageLiteral(resourceName: "ContactUs")
        default:
            break
        }
        return cell
    }
    
    private func cellularDownloadCell(indexPath pIndexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: cellIdentifiers.cellularDownloadCell.description, for: pIndexPath)
        return cell
    }
}
