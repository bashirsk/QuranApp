//
//  ActivityOverlay.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 19/05/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class ActivityOverlay: UIView {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    class func showActivityIndicatorOn(viewController pViewController: BaseViewController) -> UIView {
        let activityOverlay = Bundle.main.loadNibNamed("ActivityOverlay", owner: self, options: nil)?.first as! ActivityOverlay
        activityOverlay.frame = pViewController.activityIndicatorOverlayFrame
        pViewController.view.addSubview(activityOverlay)
        activityOverlay.activityIndicator.color = pViewController.view.tintColor
        activityOverlay.activityIndicator.startAnimating()
        return activityOverlay
    }
}
