//
//  UIFont+QP.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 23/05/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

extension UIFont {
    
    static var qp_avenirNextMedium: UIFont? {
        return  UIFont(name: "AvenirNext-Medium", size: 20)
    }
    
    static func qp_avenirNextRegular(size pSize: CGFloat? = 16) -> UIFont? {
        return UIFont(name: "AvenirNext-Regular", size: pSize!)
    }
}
