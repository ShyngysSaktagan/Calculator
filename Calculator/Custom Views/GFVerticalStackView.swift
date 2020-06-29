//
//  GFVerticalStackView.swift
//  Calculator
//
//  Created by Shyngys Saktagan on 6/29/20.
//  Copyright © 2020 ShyngysSaktagan. All rights reserved.
//

import UIKit

class GFVerticalStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    init(edge: CGFloat) {
        super.init(frame: .zero)
        layoutMargins                       = UIEdgeInsets(top: edge, left: edge, bottom: edge, right: edge)
        isLayoutMarginsRelativeArrangement  = true
        configure()
    }
    
    
    init(spacing: CGFloat) {
        super.init(frame: .zero)
        self.spacing = spacing
        configure()
    }
    
    
    init(edge: CGFloat, spacing: CGFloat) {
        super.init(frame: .zero)
        self.spacing                        = spacing
        layoutMargins                       = UIEdgeInsets(top: edge, left: edge, bottom: edge, right: edge)
        isLayoutMarginsRelativeArrangement  = true
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        axis            = .vertical
        alignment       = .fill
        distribution    = .fillEqually
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addArrangedSubviews (_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
