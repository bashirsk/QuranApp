//
//  BaseViewController.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 19/05/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let thisTableView = self.tableview else { return }
        thisTableView.qp_setTableViewDelegate(with: self)
    }
    
    // MARK:- UIViewController controls
    
    func goAway(completion pCompletion: (() -> Void)? = nil) {
        self.presentingViewController!.dismiss(animated: true, completion: pCompletion)
    }
    
    func pushViewController(with pViewController: UIViewController) {
        self.navigationController!.pushViewController(pViewController, animated: true)
    }
    
    func popViewController() {
        self.navigationController!.popViewController(animated: true)
    }
    
    func presentViewController(_ pViewController: UIViewController, completion pCompletion: (() -> Void)? = nil) {
        self.present(pViewController, animated: true, completion: pCompletion)
    }
    
    // MARK:- Segue
    
    override func prepare(for pSegue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: pSegue, sender: sender)
    }
    
    // MARK:- TableView
    
    var tableViewArray: [[Any]] {
        return []
    }
    
    func objectForIndexPath(indexPath pIndexpath: IndexPath) -> Any {
        return self.tableViewArray[pIndexpath.section][pIndexpath.row]
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource

extension BaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in pTableView: UITableView) -> Int {
        return self.tableViewArray.count
    }
    
    func tableView(_ pTableView: UITableView, numberOfRowsInSection pSection: Int) -> Int {
        return self.tableViewArray[pSection].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
