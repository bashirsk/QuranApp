//
//  SettingsViewController.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 20/05/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class SettingsViewController: BaseViewController {
    
    private let settingsCell = "SettingsCell"
    private let cellularDownloadCell =  "CellularDownloadCell"
    let reachabilityManager = ReachabilityManager()
    
    enum TableRow {
        case audioQuality, cellularDownload, aboutUs, shareApp, rateUs, contactUs
    }
    
    private var tableRows: [TableRow] = [.audioQuality, .cellularDownload, .aboutUs, .shareApp, .rateUs, .contactUs]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func enableDownloadsOverCellular() {
        reachabilityManager.checkForInternetConnection { (pAvailable) in
            if !pAvailable {
                return
            }
            // Checking both for now. Will restrict to cellular later
            // TODO
            print("Both Cellular and Wifi are available")
        }
    }
    
    override var tableViewArray: [[Any]] {
        return [self.tableRows]
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource

extension SettingsViewController {
    
    override func numberOfSections(in pTableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ pTableView: UITableView, numberOfRowsInSection pSection: Int) -> Int {
        return self.tableRows.count
    }
    
    func tableView(_ pTableView: UITableView, heightForRowAt pIndexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ pTableView: UITableView, cellForRowAt pIndexPath: IndexPath) -> UITableViewCell {
        let rowObject = self.objectForIndexPath(indexPath: pIndexPath)
        switch rowObject {
        case .cellularDownload:
            return self.cellularDownloadCell(indexPath: pIndexPath)
        default:
            return self.entryCell(indexPath: pIndexPath, rowObject)
        }
    }
    
    private func entryCell(indexPath pIndexPath: IndexPath, _ pRow: TableRow) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: self.settingsCell, for: pIndexPath) as! SettingsCell
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
        let cell = self.tableview.dequeueReusableCell(withIdentifier: self.cellularDownloadCell, for: pIndexPath) as! CellularDownloadCell
        cell.completion = { pIsOn in
            // If is switch is turned off don't allow any downloads over cellular
            if !pIsOn {
                return
            }
            self.enableDownloadsOverCellular()
        }
        return cell
    }
    
    private func objectForIndexPath(indexPath pIndexpath: IndexPath) -> TableRow {
        return self.itemForIndexPath(indexPath: pIndexpath) as! TableRow
    }
}
