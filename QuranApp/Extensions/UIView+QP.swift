//
//  UIView+QP.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 22/05/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

extension UIView {
    
    // Remove and View to re-add constraints programmatically    
    func qp_removeAndaddView() {
        if let theSuperView = self.superview {
            theSuperView.subviews.forEach {
                $0.removeFromSuperview()
                theSuperView.addSubview($0)
            }
        }
    }
}
