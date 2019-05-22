//
//  AudioQualityViewController.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 22/05/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class AudioQualityViewController: SettingsViewController {
    
    var tableRow: [TableRow] = [.streaming, .automatic, .high, .download, .normal, .downloadHigh]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.visibleCells.forEach { $0.accessoryType = .none }
        self.tableview.separatorStyle = .none
    }
    
    override var tableViewArray: [[Any]] {
        return [self.tableRow]
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource

extension AudioQualityViewController {
    
    override func tableView(_ pTableView: UITableView, cellForRowAt pIndexPath: IndexPath) -> UITableViewCell {
        let rowObject = self.objectForIndexPath(indexPath: pIndexPath)
        switch rowObject {
        case .streaming, .automatic, .high, .download, .normal, .downloadHigh:
            return self.entryCell(indexPath: pIndexPath, rowObject)
        default:
            break
        }
        return UITableViewCell()
    }    
}
