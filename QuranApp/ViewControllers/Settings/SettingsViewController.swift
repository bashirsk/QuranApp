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
        case audioQuality, cellularDownload, aboutUs, shareApp, rateUs, contactUs, streaming, automatic, high, download, normal, downloadHigh
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
    
    /**
     - Find subview from the superview's subviews
     - Remove it
     - Add it again
     - Then set a new constraint for it by centering it since it inherits one from the SettingsViewController in the Storyboard
     - Finally add it to the content view of the cell not the superview which is currently the stackView
     **/
    func centerViewInsideCell(_ cell: SettingsCell) {
        if let theSuperView = cell.settingsLabel.superview {
            theSuperView.subviews.forEach {
                $0.removeFromSuperview()
                theSuperView.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
                let horizonalConstraint = $0.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor)
                cell.contentView.addConstraint(horizonalConstraint)
            }
        }
    }
    
    //MARK:- TableView Set Up
    
    override var tableViewArray: [[Any]] {
        return [self.tableRows]
    }
    
    func objectForIndexPath(indexPath pIndexpath: IndexPath) -> TableRow {
        return self.itemForIndexPath(indexPath: pIndexpath) as! TableRow
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
    
    func cellularDownloadCell(indexPath pIndexPath: IndexPath) -> UITableViewCell {
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
    
    func entryCell(indexPath pIndexPath: IndexPath, _ pRow: TableRow) -> UITableViewCell {
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
        case .streaming:
            cell.settingsLabel.text = "Streaming"
            self.centerViewInsideCell(cell)
            cell.settingsImage.image = nil
        case .automatic:
            cell.settingsLabel.text = "Automatic (Recommended)"
            cell.settingsImage.image = nil
        case .high:
            cell.settingsLabel.text = "High"
            cell.settingsImage.image = nil
        case .download:
            cell.settingsLabel.text = "Download"
            self.centerViewInsideCell(cell)
            cell.settingsImage.image = nil
        case .normal:
            cell.settingsLabel.text = "Normal (Recommended)"
            cell.settingsImage.image = nil
        case .downloadHigh:
            cell.settingsLabel.text = "High"
            cell.settingsImage.image = nil
        default:
            break
        }
        return cell
    }
    
}
