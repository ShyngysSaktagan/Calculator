//
//  ViewController.swift
//  Calculator
//
//  Created by Shyngys Saktagan on 6/28/20.
//  Copyright © 2020 ShyngysSaktagan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let padding : CGFloat = 10
    
    var botton1 = GFButton(backgroundColor: .orange, title: "1")
    var botton2 = GFButton(backgroundColor: .orange, title: "2")
    var botton3 = GFButton(backgroundColor: .orange, title: "3")
    var botton4 = GFButton(backgroundColor: .orange, title: "4")
    
    
    var botton5 = GFButton(backgroundColor: .orange, title: "5")
    var botton6 = GFButton(backgroundColor: .orange, title: "6")
    var botton7 = GFButton(backgroundColor: .orange, title: "7")
    var botton8 = GFButton(backgroundColor: .orange, title: "8")
    
    
    var botton9 = GFButton(backgroundColor: .orange, title: "9")
    var botton10 = GFButton(backgroundColor: .orange, title: "10")
    var botton11 = GFButton(backgroundColor: .orange, title: "11")
    var botton12 = GFButton(backgroundColor: .orange, title: "12")
    
    var botton13 = GFButton(backgroundColor: .orange, title: "13")
    var botton14 = GFButton(backgroundColor: .orange, title: "14")
    var botton15 = GFButton(backgroundColor: .orange, title: "15")
    var botton16 = GFButton(backgroundColor: .orange, title: "16")
    
    var botton17 = GFButton(backgroundColor: .orange, title: "17")
    var botton18 = GFButton(backgroundColor: .orange, title: "18")
    var botton19 = GFButton(backgroundColor: .orange, title: "19")
    var botton20 = GFButton(backgroundColor: .orange, title: "20")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureButton()
    }
    
    
    let absStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        return stackView
    }()
    
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addBackground(color: .white)
        return stackView
    }()
    
    
    let stackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addBackground(color: .white)
        return stackView
    }()
    
    
    let stackView3: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addBackground(color: .white)
        return stackView
    }()
    
    
    let stackView4: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addBackground(color: .white)
        return stackView
    }()
    
    let stackView5: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addBackground(color: .white)
        return stackView
    }()

    
    func configureButton() {
        
        view.addSubview(absStackView)
        absStackView.addArrangedSubview(UIView())
        absStackView.addArrangedSubview(stackView)
        absStackView.addArrangedSubview(stackView2)
        absStackView.addArrangedSubview(stackView3)
        absStackView.addArrangedSubview(stackView4)
        absStackView.addArrangedSubview(stackView5)
        
        
        stackView.addArrangedSubview(botton1)
        stackView.addArrangedSubview(botton2)
        stackView.addArrangedSubview(botton3)
        stackView.addArrangedSubview(botton4)
        
        stackView2.addArrangedSubview(botton5)
        stackView2.addArrangedSubview(botton6)
        stackView2.addArrangedSubview(botton7)
        stackView2.addArrangedSubview(botton8)
        
        stackView3.addArrangedSubview(botton9)
        stackView3.addArrangedSubview(botton10)
        stackView3.addArrangedSubview(botton11)
        stackView3.addArrangedSubview(botton12)
        
        stackView4.addArrangedSubview(botton13)
        stackView4.addArrangedSubview(botton14)
        stackView4.addArrangedSubview(botton15)
        stackView4.addArrangedSubview(botton16)
        
        stackView5.addArrangedSubview(botton17)
        stackView5.addArrangedSubview(botton18)
        stackView5.addArrangedSubview(botton19)
        stackView5.addArrangedSubview(botton20)
        
        NSLayoutConstraint.activate([
            absStackView.heightAnchor.constraint(equalToConstant: 600),
            absStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            absStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            absStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}








extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
