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
        case audioQuality, cellularDownload, aboutUs, shareApp, rateUs, contactUs,
        streaming, automatic, high, streamingDescription, download, normal, downloadHigh
    }
    
    var tableRows = [TableRow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableRows =  [.audioQuality, .cellularDownload, .aboutUs, .shareApp, .rateUs, .contactUs]
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
    
    //MARK:- TableView Set Up
    
    override var tableViewArray: [[Any]] {
        return [self.tableRows]
    }
    
    func objectForIndexPath(indexPath pIndexpath: IndexPath) -> TableRow {
        return self.itemForIndexPath(indexPath: pIndexpath) as! TableRow
    }
    
    func cellularDownloadCell(indexPath pIndexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: self.cellularDownloadCell, for: pIndexPath) as! CellularDownloadCell
        cell.completion = { pIsOn in
            // If is switch is turned off don't allow downloads over cellular
            if !pIsOn {
                return
            }
            self.enableDownloadsOverCellular()
        }
        return cell
    }
    
    func entryCell(indexPath pIndexPath: IndexPath, _ pRow: TableRow) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: self.settingsCell, for: pIndexPath) as! SettingsCell
        switch pRow {
        case .audioQuality:
            cell.fillWith(label: "Audio Quality", image: #imageLiteral(resourceName: "AudioQuality"))
        case .aboutUs:
            cell.fillWith(label: "About us", image: #imageLiteral(resourceName: "AboutUs"))
        case .shareApp:
            cell.fillWith(label: "Share app", image: #imageLiteral(resourceName: "Share"))
        case .rateUs:
            cell.fillWith(label: "Rate us", image: #imageLiteral(resourceName: "RateUs"))
        case .contactUs:
            cell.fillWith(label: "Contact us", image: #imageLiteral(resourceName: "ContactUs"))
        case .streaming:
            cell.fillView(text: "Streaming")
        case .automatic:
            cell.fillWith(label: "Automatic (Recommended)")
        case .high:
            cell.fillWith(label: "High")
        case .streamingDescription:
            let description = "If your internet connection isn’t normally fast, please keep automatic setting selected so you can enjoy a better expericence"
            cell.fillWith(label: description, lines: 0, font: UIFont.qp_avenirNextRegular(size: 13))
            cell.addConstraintsToLabel()
        case .download:
            cell.fillView(text: "Download")
        case .normal:
            cell.fillWith(label: "Normal (Recommended)")
        case .downloadHigh:
            cell.fillWith(label: "High")
        default:
            break
        }
        return cell
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource

extension SettingsViewController {
    
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
    
    func tableView(_ pTableView: UITableView, didSelectRowAt pIndexPath: IndexPath) {
        pTableView.deselectRow(at: pIndexPath, animated: true)
        let rowObject = self.objectForIndexPath(indexPath: pIndexPath)
        switch rowObject {
        case .audioQuality:
            let theViewController = UIStoryboard(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "AudioQualityVC") as! AudioQualityViewController
            self.navigationController?.pushViewController(theViewController, animated: true)
        default:
            break
        }
    }
}
