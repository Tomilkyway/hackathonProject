//
//  NavigationViewController.swift
//  Hackathon
//
//  Created by Thomas Pain-Surget on 05/10/2017.
//  Copyright © 2017 Henri Gil. All rights reserved.
//

import UIKit
import ChameleonFramework

class NavViewController: UINavigationController, UIGestureRecognizerDelegate {
    
    /// Custom back buttons disable the interactive pop animation
    /// To enable it back we set the recognizer to `self`
    override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
        navigationBar.backgroundColor = .flatBlack
        navigationBar.isTranslucent = false
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
    
}
