//
//  AuthorizationViewInput.swift
//  HeadsHands
//
//  Created by Захар Бабкин on 04/02/2019.
//  Copyright © 2019 Захар Бабкин. All rights reserved.
//

import Foundation

protocol AuthorizationViewInput: AnyObject, ActivityIndicatorPresentable {
    func showAlert(_ title: String, message: String)
}
