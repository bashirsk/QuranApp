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
        delegate = pDelegate
        dataSource = pDelegate
        tableFooterView = UIView()
    }
    
    // Set up 'pull to refresh'
    func qp_setUpRefereshControl(with pSelector: Selector) {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(delegate, action: pSelector, for: .valueChanged)
        addSubview(refreshControl)
    }
}
