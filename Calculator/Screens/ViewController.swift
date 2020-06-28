//
//  ViewController.swift
//  Calculator
//
//  Created by Shyngys Saktagan on 6/28/20.
//  Copyright © 2020 ShyngysSaktagan. All rights reserved.
//

import UIKit

class CalculatorView: UIViewController {
    
    var resultLabel = GFResultLabel()
    
    var botton0 = GFButton(backgroundColor: .gray, title: "0")
    var botton1 = GFButton(backgroundColor: .gray, title: "1")
    var botton2 = GFButton(backgroundColor: .gray, title: "2")
    var botton3 = GFButton(backgroundColor: .gray, title: "3")
    var botton4 = GFButton(backgroundColor: .gray, title: "4")
    var botton5 = GFButton(backgroundColor: .gray, title: "5")
    var botton6 = GFButton(backgroundColor: .gray, title: "6")
    var botton7 = GFButton(backgroundColor: .gray, title: "7")
    var botton8 = GFButton(backgroundColor: .gray, title: "8")
    var botton9 = GFButton(backgroundColor: .gray, title: "9")
    
    var botton10 = GFButton(backgroundColor: .orange, title: "+")
    var botton11 = GFButton(backgroundColor: .orange, title: "-")
    var botton12 = GFButton(backgroundColor: .orange, title: "x")
    var botton13 = GFButton(backgroundColor: .orange, title: "÷")
    var botton15 = GFButton(backgroundColor: .orange, title: "=")
    
    var botton14 = GFButton(backgroundColor: .systemGray3, title: "√", titleColor: .black)
    var botton16 = GFButton(backgroundColor: .systemGray3, title: "C", titleColor: .black)
    
    var botton17 = GFButton(backgroundColor: .gray, title: "")
    var botton18 = GFButton(backgroundColor: .systemGray3, title: "")
    var botton19 = GFButton(backgroundColor: .orange, title: "")
    
    
    let stackView = GFStackView(edge: 10, spacing: 10)
    let equalStack = GFStackView(spacing: 10)
    
    let stackView2 = GFStackView(edge: 10, spacing: 10)
    let stackView3 = GFStackView(edge: 10, spacing: 10)
    let stackView4 = GFStackView(edge: 10, spacing: 10)
    let stackView5 = GFStackView(edge: 10, spacing: 10)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        resultLabel.text = "0"
        configureAbsStackView()
        configureButton()
        
    }
    
    func configureAbsStackView() {
        absStackView.addArrangedSubview(stackView5)
        absStackView.addArrangedSubview(stackView4)
        absStackView.addArrangedSubview(stackView3)
        absStackView.addArrangedSubview(stackView2)
        absStackView.addArrangedSubview(stackView)
    }
    
    
    let absStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    func configureButton() {
        view.addSubview(resultLabel)
        view.addSubview(absStackView)
        
        stackView5.addArrangedSubview(botton16)
        stackView5.addArrangedSubview(botton18)
        stackView5.addArrangedSubview(botton14)
        stackView5.addArrangedSubview(botton13)
        
        stackView4.addArrangedSubview(botton7)
        stackView4.addArrangedSubview(botton8)
        stackView4.addArrangedSubview(botton9)
        stackView4.addArrangedSubview(botton12)
        
        stackView3.addArrangedSubview(botton4)
        stackView3.addArrangedSubview(botton5)
        stackView3.addArrangedSubview(botton6)
        stackView3.addArrangedSubview(botton11)
               
        stackView2.addArrangedSubview(botton1)
        stackView2.addArrangedSubview(botton2)
        stackView2.addArrangedSubview(botton3)
        stackView2.addArrangedSubview(botton10)
        
        equalStack.addArrangedSubview(botton17)
        equalStack.addArrangedSubview(botton15)
        
        stackView.addArrangedSubview(botton0)
        stackView.addArrangedSubview(equalStack)
        
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 210),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultLabel.heightAnchor.constraint(equalToConstant: 100),
            
            absStackView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 10),
            absStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            absStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            absStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
