//
//  AudioQualityViewController.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 22/05/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class AudioQualityViewController: SettingsViewController {
    
    var tableRow: [TableRow] = [.streaming, .automatic, .high, .streamingDescription, .download, .normal, .downloadHigh]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.visibleCells.forEach { $0.accessoryType = .none }
        self.tableview.separatorStyle = .none
    }
    
    //MARK:- TableView Set Up
    
    override var tableViewArray: [[Any]] {
        return [self.tableRow]
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource

extension AudioQualityViewController {
    
    override func tableView(_ pTableView: UITableView, cellForRowAt pIndexPath: IndexPath) -> UITableViewCell {
        let rowObject = self.objectForIndexPath(indexPath: pIndexPath)
        switch rowObject {
        case .streaming, .automatic, .high, .streamingDescription, .download, .normal, .downloadHigh:
            return self.entryCell(indexPath: pIndexPath, rowObject)
        default:
            break
        }
        return UITableViewCell()
    }
    
    override func tableView(_ pTableView: UITableView, heightForRowAt pIndexPath: IndexPath) -> CGFloat {
        let rowObject = self.objectForIndexPath(indexPath: pIndexPath)
        switch rowObject {
        case .streamingDescription:
            return 80
        default:
            break
        }
        return 50
    }
}
