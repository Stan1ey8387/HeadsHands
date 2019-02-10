//
//  AuthorizationBuilder.swift
//  HeadsHands
//
//  Created by Захар Бабкин on 04/02/2019.
//  Copyright © 2019 Захар Бабкин. All rights reserved.
//

import UIKit

class AuthorizationBuilder: Builder {
    var module: UIViewController {
        let authViewController = UIStoryboard(name: "Authorization", bundle: nil).instantiateInitialViewController() as! AuthorizationViewController
        let authViewModel = AuthorizationViewModel()
        
        authViewController.viewModel = authViewModel
        authViewModel.view = authViewController
        
        return authViewController
    }
}
