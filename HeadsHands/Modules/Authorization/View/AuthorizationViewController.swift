//
//  AuthorizationViewController.swift
//  HeadsHands
//
//  Created by Захар Бабкин on 29/01/2019.
//  Copyright © 2019 Захар Бабкин. All rights reserved.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    var viewModel: AuthorizationViewOutput?
    
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var forgotPasswordButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!
    
    @IBOutlet private weak var createAccountBottomConstraint: NSLayoutConstraint?
    
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupKeyboardObserver()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    // MARK: IBAction
    
    @IBAction func forgotPasswordButtonAction(_ sender: Any) {
        print("forgotPasswordButtonAction is pressed")
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        startActivity(isUserInteractionEnabled: false)
        viewModel?.auth(email: emailTextField.text, password: passwordTextField.text)
    }
    
    @IBAction func createAccountButtonAction(_ sender: Any) {
        print("createAccountButtonAction is pressed")
    }
    
    
    // MARK: Private methods
    
    private func setupView() {
        forgotPasswordButton.setBorder(color: UIColor.Separator.lightGray, radius: UIButton.Radius.border)
        loginButton.setRadius(loginButton.frame.height / 2)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    private func setupKeyboardObserver() {
        let createAccountBottomConstraintDefault = createAccountBottomConstraint?.constant ?? 0
        
        KeyboardObserver.willShow { [weak self] (keyboardFrame) in
            guard let strongSelf = self else { return }
            strongSelf.createAccountBottomConstraint?.constant = keyboardFrame.height + createAccountBottomConstraintDefault - strongSelf.view.safeAreaInsets.bottom
            
            UIView.animate(withDuration: 0.3, animations: {
                strongSelf.view.layoutIfNeeded()
            })
        }
        
        KeyboardObserver.willHide { [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.createAccountBottomConstraint?.constant = createAccountBottomConstraintDefault
            
            UIView.animate(withDuration: 0.3, animations: {
                strongSelf.view.layoutIfNeeded()
            })
        }
    }
    
    
    // MARK: Private objc methods
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}


// MARK: AuthorizationViewInput

extension AuthorizationViewController: AuthorizationViewInput {
    func showAlert(_ title: String, message: String) {
        showAlert(title, message: message, titleAction: "OK", cancelAction: false)
    }
}


// MARK: UITextFieldDelegate

extension AuthorizationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            loginButtonAction(loginButton)
            textField.endEditing(true)
        }
        
        return true
    }
}
