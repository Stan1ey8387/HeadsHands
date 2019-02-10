//
//  SplashViewController.swift
//  HeadsHands
//
//  Created by Захар Бабкин on 04/02/2019.
//  Copyright © 2019 Захар Бабкин. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    @IBAction func showAuthorizationButtonAction(_ sender: Any) {
        let authModule = AuthorizationBuilder().module
        self.navigationController?.pushViewController(authModule, animated: true)
    }
}
