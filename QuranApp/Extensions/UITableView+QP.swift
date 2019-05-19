//
//  UITableView+QP.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 19/05/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

extension UITableView {
    
    // Set up delegation
    func qp_setTableViewDelegate(with pDelegate: UITableViewDelegate & UITableViewDataSource) {
        self.delegate = pDelegate
        self.dataSource = pDelegate
        self.tableFooterView = UIView()
    }
    
    // Set up 'pull to refresh'
    func qp_setUpRefereshControl(with pSelector: Selector) {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self.delegate, action: pSelector, for: .valueChanged)
        self.addSubview(refreshControl)
    }
}
