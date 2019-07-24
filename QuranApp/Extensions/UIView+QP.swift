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
    
    // Add rounded corners, border width and color
    func qp_addRoundRectBorderWithColour(_ pColour: UIColor, width pWidth: CGFloat = 2.0, radius pRadius: CGFloat = 8.0) {
        layer.borderWidth = pWidth
        layer.cornerRadius = pRadius
        layer.borderColor = pColour.cgColor
        clipsToBounds = true
    }
    
    func qp_addCornerRadius(_ pRadius: CGFloat = -1) {
        let radiusValue = (pRadius == -1) ? frame.height / 2 : pRadius
        layer.cornerRadius = radiusValue
    }
}
