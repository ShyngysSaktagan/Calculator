//
//  UIStackView + Ext.swift
//  Calculator
//
//  Created by Shyngys Saktagan on 6/28/20.
//  Copyright © 2020 ShyngysSaktagan. All rights reserved.
//

import UIKit

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView                 = UIView(frame: bounds)
        subView.backgroundColor     = color
        subView.autoresizingMask    = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
