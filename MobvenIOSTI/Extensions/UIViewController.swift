//
//  UIViewController.swift
//  MobvenIOSTI
//
//  Created by Gizem Fitoz on 10.11.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

private let swizzling: (AnyClass, Selector, Selector) -> () = { forClass, originalSelector, swizzledSelector in
    let originalMethod = class_getInstanceMethod(forClass, originalSelector)
    let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
    method_exchangeImplementations(originalMethod!, swizzledMethod!)
}

public extension UIViewController {

    static let classInitForVersion: Void = {
        let originalSelector = #selector(viewDidAppear(_:))
        let swizzledSelector = #selector(swizzledViewDidAppear(_:))
        swizzling(UIViewController.self, originalSelector, swizzledSelector)
    }()

    @objc func swizzledViewDidAppear(_ animated: Bool) {
        VersionConfig.shared?.show()
        swizzledViewDidAppear(animated)
    }

}
