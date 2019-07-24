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
    }
    
    override func viewWillAppear(_ pAnimated: Bool) {
        super.viewWillAppear(pAnimated)
        navigationController?.navigationBar.tintColor = .white
    }
    
    //MARK:- TableView Set Up
    
    override var tableViewArray: [[Any]] {
        return [tableRow]
    }
}

//MARK:- UITableViewDelegate

extension AudioQualityViewController {
    
    override func tableView(_ pTableView: UITableView, cellForRowAt pIndexPath: IndexPath) -> UITableViewCell {
        let rowObject = objectForIndexPath(indexPath: pIndexPath)
        switch rowObject {
        case .streaming, .automatic, .high, .streamingDescription, .download, .normal, .downloadHigh:
            return entryCell(indexPath: pIndexPath, rowObject)
        default:
            break
        }
        return UITableViewCell()
    }
        
    override func tableView(_ pTableView: UITableView, heightForRowAt pIndexPath: IndexPath) -> CGFloat {
        let rowObject = objectForIndexPath(indexPath: pIndexPath)
        switch rowObject {
        case .streamingDescription:
            return 80
        default:
            break
        }
        return 50
    }
}

