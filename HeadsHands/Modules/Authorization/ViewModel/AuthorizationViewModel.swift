//
//  AuthorizationViewModel.swift
//  HeadsHands
//
//  Created by Захар Бабкин on 29/01/2019.
//  Copyright © 2019 Захар Бабкин. All rights reserved.
//

import Foundation

class AuthorizationViewModel {
    weak var view: AuthorizationViewInput?
    
    
    // MARK: Private structs
    
    private struct Constants {
        static let error = "Ошибка"
        static let cityNotDefined = "Город не определен"
        static let temp = "Температура"
        static let celsius = "°C"
    }
    
    
    // MARK: Private methods
    
    private func getWeather() {
        NetworkService.getWeather { (weather, error) in
            self.view?.stopActivity()
            
            if let error = error {
                self.view?.showAlert(Constants.error, message: error.localizedDescription)
            } else if let weather = weather {
                let city = weather.name ?? Constants.cityNotDefined
                let temp = weather.main.temp
                self.view?.showAlert(city, message: "\(Constants.temp) \(temp) \(Constants.celsius)")
            }
        }
    }
}


// MARK: AuthorizationViewOutput

extension AuthorizationViewModel: AuthorizationViewOutput {
    func auth(email: String?, password: String?) {
        guard let email = email, email.isEmail else {
            view?.stopActivity()
            view?.showAlert(Constants.error, message: AuthError.incorrectEmail.localizedDescription)
            return
        }
        guard let password = password, password.isPassword else {
            view?.stopActivity()
            view?.showAlert(Constants.error, message: AuthError.incorrectPassword.localizedDescription)
            return
        }
        
        getWeather()
    }
    
}


// MARK: Private String extension

private extension String {
    var isEmail: Bool {
        let pattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: self)
    }
    
    var isPassword: Bool {
        let pattern = "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])[a-zA-Z0-9]{6,}$"
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: self)
    }
}
