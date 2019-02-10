//
//  AuthError.swift
//  HeadsHands
//
//  Created by Захар Бабкин on 04/02/2019.
//  Copyright © 2019 Захар Бабкин. All rights reserved.
//

import Foundation


enum AuthError: Error {
    case incorrectEmail
    case incorrectPassword
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .incorrectEmail:
            return NSLocalizedString("Некорректный формат e-mail. Пожалуйста, проверьте введенный e-mail.", comment: "Ошибка авторизации")
        case .incorrectPassword:
            return NSLocalizedString("Пароль должен быть не менее 6-ти символов в длину и содержать минимум 1 строчную букву, 1 заглавную, и 1 цифру.", comment: "Ошибка авторизации")
        }
    }
}
