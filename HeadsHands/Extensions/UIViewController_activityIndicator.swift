//
//  UIViewController_activityIndicator.swift
//  HeadsHands
//
//  Created by Захар Бабкин on 29/01/2019.
//  Copyright © 2019 Захар Бабкин. All rights reserved.
//

import UIKit

protocol ActivityIndicatorPresentable {
    func startActivity(style: UIActivityIndicatorView.Style, isUserInteractionEnabled: Bool)
    func stopActivity()
}

extension ActivityIndicatorPresentable where Self: UIViewController {
    func startActivity(style: UIActivityIndicatorView.Style = .gray, isUserInteractionEnabled: Bool = false) {
        if let activityIndicator = findActivity() {
            activityIndicator.startAnimating()
        } else {
            let activityIndicator = UIActivityIndicatorView(style: style)
            activityIndicator.startAnimating()
            view.addSubview(activityIndicator)
            
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                activityIndicator.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
                ])
        }
        
        view.isUserInteractionEnabled = isUserInteractionEnabled
    }
    
    func stopActivity() {
        findActivity()?.stopAnimating()
        view.isUserInteractionEnabled = true
    }
    
    private func findActivity() -> UIActivityIndicatorView? {
        return view.subviews.compactMap { $0 as? UIActivityIndicatorView }.first
    }
}
