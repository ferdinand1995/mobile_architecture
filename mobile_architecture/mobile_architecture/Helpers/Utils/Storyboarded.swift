//
//  Storyboarded.swift
//  mobile_architecture
//
//  Created by Ferdinand on 17/11/20.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {

    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if #available(iOS 13.0, *) {
            return storyboard.instantiateViewController(identifier: id) as! Self
        } else {
            return storyboard.instantiateInitialViewController() as! Self
        }
    }
}
