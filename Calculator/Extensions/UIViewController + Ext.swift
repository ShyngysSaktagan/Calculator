//
//  UIViewController + Ext.swift
//  Calculator
//
//  Created by Shyngys Saktagan on 6/28/20.
//  Copyright © 2020 ShyngysSaktagan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func configureNavigationBar(largeTitleColor: UIColor, backgoundColor: UIColor, tintColor: UIColor, title: String, preferredLargeTitle: Bool) {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.largeTitleTextAttributes                   = [.foregroundColor: largeTitleColor]
            navBarAppearance.titleTextAttributes                        = [.foregroundColor: largeTitleColor]
            navBarAppearance.backgroundColor                            = backgoundColor
            
            navigationController?.navigationBar.standardAppearance      = navBarAppearance
            navigationController?.navigationBar.compactAppearance       = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance    = navBarAppearance
            
            navigationController?.navigationBar.prefersLargeTitles      = preferredLargeTitle
            navigationController?.navigationBar.isTranslucent           = false
            navigationController?.navigationBar.tintColor               = tintColor
            navigationItem.title                                        = title
            
        } else {
            navigationController?.navigationBar.barTintColor            = backgoundColor
            navigationController?.navigationBar.tintColor               = tintColor
            navigationController?.navigationBar.isTranslucent           = false
            navigationItem.title                                        = title
        }
    }

}
