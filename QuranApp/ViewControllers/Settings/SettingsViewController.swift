//
//  SettingsViewController.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 20/05/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit
import MessageUI

class SettingsViewController: BaseViewController {
    
    private let settingsCell = "SettingsCell"
    private let cellularDownloadCell =  "CellularDownloadCell"
    var selectedIndexPath: IndexPath?
    let reachabilityManager = ReachabilityManager()
    
    enum TableRow {
        case audioQuality, cellularDownload, aboutUs, shareApp, rateUs, contactUs,
        streaming, automatic, high, streamingDescription, download, normal, downloadHigh
    }
    
    var tableRows = [TableRow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableRows =  [.audioQuality, .cellularDownload, .aboutUs, .shareApp, .rateUs, .contactUs]
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
        return [tableRows]
    }
    
    func objectForIndexPath(indexPath pIndexpath: IndexPath) -> TableRow {
        return itemForIndexPath(indexPath: pIndexpath) as! TableRow
    }
    
    func cellularDownloadCell(indexPath pIndexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: self.cellularDownloadCell, for: pIndexPath) as! CellularDownloadCell
        cell.completion = { pIsOn in
            // If is switch is turned off don't allow downloads over cellular
            if !pIsOn {
                return
            }
            self.enableDownloadsOverCellular()
        }
        return cell
    }
    
    // Set up all cells for both Settings an AudioQuality ViewControllers
    private func setUpAllCells(_ pRow: TableRow, _ cell: SettingsCell, _ pIndexPath: IndexPath) {
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
            cell.fillViewInAudioViewController(text: "Streaming")
        case .automatic:
            cell.fillWith(label: "Automatic (Recommended)")
            cell.checkMarkImage.isHidden = pIndexPath != selectedIndexPath
        case .high:
            cell.fillWith(label: "High")
            cell.checkMarkImage.isHidden = pIndexPath != selectedIndexPath
        case .streamingDescription:
            let description = "If your internet connection isn’t normally fast, please keep automatic setting selected so you can enjoy a better expericence"
            cell.fillWith(label: description, lines: 0, font: UIFont.qp_avenirNextRegular(size: 13))
            cell.setUpConstraints()
        case .download:
            cell.fillViewInAudioViewController(text: "Download")
        case .normal:
            cell.fillWith(label: "Normal (Recommended)")
            cell.checkMarkImage.isHidden = pIndexPath != selectedIndexPath
        case .downloadHigh:
            cell.fillWith(label: "High")
            cell.checkMarkImage.isHidden = pIndexPath != selectedIndexPath
        default:
            break
        }
    }
    
    func entryCell(indexPath pIndexPath: IndexPath, _ pRow: TableRow) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: settingsCell, for: pIndexPath) as! SettingsCell
        setUpAllCells(pRow, cell, pIndexPath)
        return cell
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource

extension SettingsViewController {
    
    func tableView(_ pTableView: UITableView, heightForRowAt pIndexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ pTableView: UITableView, cellForRowAt pIndexPath: IndexPath) -> UITableViewCell {
        let rowObject = objectForIndexPath(indexPath: pIndexPath)
        switch rowObject {
        case .cellularDownload:
            return cellularDownloadCell(indexPath: pIndexPath)
        default:
            return entryCell(indexPath: pIndexPath, rowObject)
        }
    }
    
    func tableView(_ pTableView: UITableView, didSelectRowAt pIndexPath: IndexPath) {
        selectedIndexPath = pIndexPath
        pTableView.reloadData()
        let rowObject = objectForIndexPath(indexPath: pIndexPath)
        switch rowObject {
        case .audioQuality:
            let theViewController = UIStoryboard(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "AudioQualityVC") as! AudioQualityViewController
            pushViewController(with: theViewController)
        case .contactUs:
            sendEmail()
        default:
            break
        }
        pTableView.deselectRow(at: pIndexPath, animated: true)
    }
}

extension SettingsViewController: MFMailComposeViewControllerDelegate {
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["bashirsk23@gmail.com"])
            mail.setMessageBody("Write here", isHTML: false)
            present(mail, animated: true)
        } else {
            UIAlertController.qp_showAlert(title: "Oops", message: "Can't send email", from: self)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
