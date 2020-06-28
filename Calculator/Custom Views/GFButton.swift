//
//  GFButton.swift
//  Calculator
//
//  Created by Shyngys Saktagan on 6/28/20.
//  Copyright © 2020 ShyngysSaktagan. All rights reserved.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    
    init(backgroundColor: UIColor, title: String, titleColor: UIColor) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        configure()
    }
    
    
    private func configure() {
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline)
        self.titleLabel?.font   = UIFont.boldSystemFont(ofSize: 40)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame.size         = CGSize(width: 80, height: 80)
        self.layer.cornerRadius = 0.5 * bounds.size.width
        self.clipsToBounds = true
    }
    
    
    func set(backgroundColor: UIColor, title: String, titleColor: UIColor) {
        setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
    }
}
