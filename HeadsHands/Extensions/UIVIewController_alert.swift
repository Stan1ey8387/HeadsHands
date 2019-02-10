//
//  UIVIewController_alert.swift
//  HeadsHands
//
//  Created by Захар Бабкин on 04/02/2019.
//  Copyright © 2019 Захар Бабкин. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(_ title: String?, message: String?, titleAction: String?, cancelAction:Bool, handler: ((UIAlertAction) -> ())? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert )
            let action = UIAlertAction(title: titleAction, style: .default, handler: handler)
            
            alert.addAction(action)
            
            if cancelAction {
                let cancel = UIAlertAction (title: "Отмена", style: .cancel, handler: nil)
                alert.addAction(cancel)
            }
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
