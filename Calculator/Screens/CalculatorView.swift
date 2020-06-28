//
//  ViewController.swift
//  Calculator
//
//  Created by Shyngys Saktagan on 6/28/20.
//  Copyright © 2020 ShyngysSaktagan. All rights reserved.
//

import UIKit


protocol CalculatorViewDelegate {
    func add(data: String)
    func getData()
}


class CalculatorView: UIViewController {
    
    var delegate : CalculatorViewDelegate?
    
    var numberFromScreen:Double = 0
    var firstNum:Double = 0
    var operation:String = ""
    var mathSign:Bool = false
    var afterEqual = false
    
    var resultLabel = GFResultLabel()
    
    var numbers : [GFButton]?
    var actions : [GFButton]?
    
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
    var botton18 = GFButton(backgroundColor: .gray, title: "")
    
    
    var botton10 = GFButton(backgroundColor: .orange, title: "+")
    var botton11 = GFButton(backgroundColor: .orange, title: "-")
    var botton12 = GFButton(backgroundColor: .orange, title: "x")
    var botton13 = GFButton(backgroundColor: .orange, title: "÷")
    var botton14 = GFButton(backgroundColor: .orange, title: "=")
    
    var botton15 = GFButton(backgroundColor: .systemGray3, title: "√", titleColor: .black)
    var botton16 = GFButton(backgroundColor: .systemGray3, title: "C", titleColor: .black)
    var botton17 = GFButton(backgroundColor: .systemGray3, title: "◀︎", titleColor: .black)
    
    
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
        addFunctionToNumbers()
        addFunctionToActions()
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .white, title: "", preferredLargeTitle: false)
        setupTableViewButtonInNavBar()
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    func setupTableViewButtonInNavBar() {
//        let addSymbol = UIImage(systemName: SFSymbols.tableViewIcon)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "❖", style: .plain, target: self, action: #selector(pushToTableView))
    }
    
    
    @objc func pushToTableView() {
        let resultsVC = ResultsVC()
        navigationController?.pushViewController(resultsVC, animated: true)
    }
    
    
    
    func addFunctionToActions() {
        actions = [botton10,botton11,botton12,botton13,botton14,botton15,botton16,botton17]
        actions?.forEach({ $0.addTarget(self, action: #selector(didTapAction(_:)), for: .touchUpInside) })
    }
    
    
    func addFunctionToNumbers() {
        numbers = [botton1,botton2,botton3,botton4,botton5,botton6,botton7,botton8,botton9]
        numbers?.forEach({ $0.addTarget(self, action: #selector(didTapNumber(_:)), for: .touchUpInside)})
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
        stackView5.addArrangedSubview(botton17)
        stackView5.addArrangedSubview(botton15)
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
        
        equalStack.addArrangedSubview(botton18)
        equalStack.addArrangedSubview(botton14)
        
        stackView.addArrangedSubview(botton0)
        stackView.addArrangedSubview(equalStack)
        
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 175),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultLabel.heightAnchor.constraint(equalToConstant: 60),
            
            absStackView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 10),
            absStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            absStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            absStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    @objc private func didTapNumber(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "")
        
        if mathSign {
            resultLabel.text = sender.titleLabel?.text
            mathSign = false
        }else if afterEqual {
            resultLabel.text = sender.titleLabel?.text
            afterEqual = false
        }
            
        else {
            if (resultLabel.text!.count < 9) {
                if resultLabel.text == "0" {
                    resultLabel.text = sender.titleLabel?.text
                } else {
                    resultLabel.text = "\(resultLabel.text ?? "")\(sender.titleLabel?.text ?? "")"
                }
            }
        }
        
        numberFromScreen = Double(resultLabel.text!)!
    }
    
    
    @objc private func didTapAction(_ sender: UIButton) {
        print(sender.titleLabel!.text!)
        if sender.titleLabel!.text! != "0" && sender.titleLabel!.text! != "C" && sender.titleLabel!.text! != "◀︎" && sender.titleLabel!.text! != "=" {
            firstNum = Double(resultLabel.text!)!
            operation = sender.titleLabel!.text!
            mathSign = true
        }
        else if sender.titleLabel!.text! == "=" {
            afterEqual = true
            if operation == "+" {
                resultLabel.text = String(firstNum + numberFromScreen)
            }
            else if operation == "-" {
                resultLabel.text = String(firstNum - numberFromScreen)
            }
            else if operation == "x" {
                resultLabel.text = String(firstNum * numberFromScreen)
            }
            else if operation == "÷" {
                resultLabel.text = String(firstNum / numberFromScreen)
            }
        
            PersitenceManager.updateWith(number: resultLabel.text!)
            
            
        }
            // TODO
        else if sender.titleLabel!.text! == "√" {
//            resultLabel.text = String( Double(resultLabel.text!)?.squareRoot() )
        }
        else if sender.titleLabel!.text! == "◀︎" {
            afterEqual = false
            if resultLabel.text!.count > 1 {
                resultLabel.text = String(resultLabel.text?.prefix(resultLabel.text!.count - 1) ?? "0")
            }
            else if resultLabel.text!.count == 1 && resultLabel.text! != "0" {
                resultLabel.text = "0"
            }
        }
        else if sender.titleLabel!.text! == "C" {
            resultLabel.text = "0"
            firstNum = 0
            numberFromScreen = 0
            operation = ""
            afterEqual = false
        }
    }
}
