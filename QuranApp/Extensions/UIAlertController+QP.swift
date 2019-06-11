//
//  UIAlertController+QP.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 11/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    class func qp_alertController(title: String? = nil, message: String? = nil, actionSheet: Bool = false) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: (actionSheet) ? .actionSheet : .alert)
    }
    
    func qp_addCancelAction(title: String = "Cancel", handler: (() -> Void)? = nil) {
        qp_addAction(title: title, style: .cancel, handler: handler)
    }
    
    func qp_addAction(title: String, style: UIAlertAction.Style = .default, handler: (() -> Void)? = nil) {
        addAction(UIAlertAction(title: title, style: style, handler: { (action) in
            if let theHandler = handler {
                theHandler()
            }
        }))
    }
    
    func qp_presentFrom(_ pFrom: UIViewController) {
        view.tintColor = pFrom.view.tintColor
        pFrom.present(self, animated: true)
    }

    class func qp_showAlert(title: String? = nil, message: String? = nil, from: UIViewController, completion: (() -> Void)? = nil) {
        let theAlert = UIAlertController.qp_alertController(title: title, message: message)
        theAlert.qp_addCancelAction(title: "OK", handler:completion)
        theAlert.qp_presentFrom(from)
    }

    class func qp_showErrorAlert(error pError: Error, from pfrom: UIViewController) {
        qp_showAlert(title: "Error", message: pError.localizedDescription, from: pfrom)
    }

    class func qp_showConfirm(title pTitle: String? = nil, message pMessage: String? = nil, button pButton: String = "OK", style pStyle: UIAlertAction.Style = .default, from pFrom: UIViewController, action pAction: @escaping () -> Void) {
        let theAlert = UIAlertController.qp_alertController(title: pTitle, message: pMessage)
        theAlert.qp_addAction(title: pButton, style: pStyle, handler: pAction)
        theAlert.qp_addCancelAction()
        pFrom.present(theAlert, animated: true)
    }
}
