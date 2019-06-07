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
        guard let thisTableView = tableview else { return }
        thisTableView.qp_setTableViewDelegate(with: self)
    }
    
    // MARK:- UIViewController control set up
    
    func goAway(completion pCompletion: (() -> Void)? = nil) {
        presentingViewController?.dismiss(animated: true, completion: pCompletion)
    }
    
    func pushViewController(with pViewController: UIViewController) {
        navigationController?.pushViewController(pViewController, animated: true)
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func presentViewController(_ pViewController: UIViewController, completion pCompletion: (() -> Void)? = nil) {
        present(pViewController, animated: true, completion: pCompletion)
    }
    
    // MARK:- Segue
    
    override func prepare(for pSegue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: pSegue, sender: sender)
    }
    
    // MARK:- Overlay set up
    
    var overlay: UIView?
    
    func showOverlay(show pShow: Bool = true) {
        if pShow {
            if overlay == nil {
                overlay = ActivityOverlay.showActivityIndicatorOn(viewController: self)
            }
        } else {
            if overlay != nil {
                overlay?.removeFromSuperview()
                overlay = nil
            }
        }
    }
    
    var activityIndicatorOverlayFrame: CGRect {
        var activityFrame = view.bounds
        if let safeAreaInsets = UIApplication.shared.keyWindow?.safeAreaInsets {
            activityFrame = activityFrame.inset(by: safeAreaInsets)
        }
        return activityFrame
    }
    
    // MARK:- TableView set up
    
    var tableViewArray: [[Any]] {
        return []
    }
    
    func itemForIndexPath(indexPath pIndexpath: IndexPath) -> Any {
        return tableViewArray[pIndexpath.section][pIndexpath.row]
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource

extension BaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in pTableView: UITableView) -> Int {
        return tableViewArray.count
    }
    
    // Number of rows set up here. No need to set up in any subclasses
    func tableView(_ pTableView: UITableView, numberOfRowsInSection pSection: Int) -> Int {
        return tableViewArray[pSection].count
    }
    
    func tableView(_ pTableView: UITableView, cellForRowAt pIndexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }    
}
