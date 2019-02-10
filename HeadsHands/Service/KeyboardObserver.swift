//
//  KeyboardObserver.swift
//  HeadsHands
//
//  Created by Захар Бабкин on 29/01/2019.
//  Copyright © 2019 Захар Бабкин. All rights reserved.
//

import UIKit

class KeyboardObserver {
    
    static func willShow(completion: @escaping(CGRect) ->() ){
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (note) in
            let frame = (note.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            let duration = (note.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
            let curve = UIView.AnimationOptions(rawValue: (note.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! NSNumber).uintValue)
            UIView.animate(withDuration: duration, delay: 0, options: curve, animations: {
                completion(frame)
                
            }, completion: nil)
        }
    }
    
    static func willHide(completion: @escaping(CGRect) ->() ){
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (note) in
            let frame = (note.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            let duration = (note.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
            let curve = UIView.AnimationOptions(rawValue: (note.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! NSNumber).uintValue)
            UIView.animate(withDuration: duration, delay: 0, options: curve, animations: {
                completion(frame)
                
            }, completion: nil)
        }
    }
}
