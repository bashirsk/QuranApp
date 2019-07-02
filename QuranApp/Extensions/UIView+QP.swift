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
        if let theSuperView = superview {
            theSuperView.subviews.forEach {
                $0.removeFromSuperview()
                theSuperView.addSubview($0)
            }
        }
    }

    func qp_addCornerRadius(_ pRadius: CGFloat = -1) {
        let radiusValue = (pRadius == -1) ? self.frame.height / 2 : pRadius
        self.layer.cornerRadius = radiusValue
    }

    func qp_addRoundRectBorderWithColour(_ pColour: UIColor, width pWidth: CGFloat = 2.0, radius pRadius: CGFloat = 6.0) {
        self.layer.borderWidth = pWidth
        self.layer.cornerRadius = pRadius
        self.layer.borderColor = pColour.cgColor
        self.clipsToBounds = true
    }
}
