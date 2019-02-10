//
//  AuthorizationViewOutput.swift
//  HeadsHands
//
//  Created by Захар Бабкин on 04/02/2019.
//  Copyright © 2019 Захар Бабкин. All rights reserved.
//

import Foundation

protocol AuthorizationViewOutput {
    func auth(email: String?, password: String?)
}
