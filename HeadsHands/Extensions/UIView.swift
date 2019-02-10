//
//  UIView.swift
//  HeadsHands
//
//  Created by Захар Бабкин on 29/01/2019.
//  Copyright © 2019 Захар Бабкин. All rights reserved.
//

import UIKit


extension UIView {
    /// Set border for view, default width = 1, radius = 1
    func setBorder(width: CGFloat = 1, color: UIColor, radius: CGFloat = 0) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        
        if radius > 0 {
            self.setRadius(radius)
        }
    }
    
    /// Set radius for view
    func setRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
