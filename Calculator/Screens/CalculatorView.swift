//
//  ViewController.swift
//  Calculator
//
//  Created by Shyngys Saktagan on 6/28/20.
//  Copyright © 2020 ShyngysSaktagan. All rights reserved.
//

import UIKit
import SnapKit

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
    
    var botton0 = GFButton(backgroundColor: .darkGray, title: "0")
    
    var botton1 = GFButton(backgroundColor: .darkGray, title: "1")
    var botton2 = GFButton(backgroundColor: .darkGray, title: "2")
    var botton3 = GFButton(backgroundColor: .darkGray, title: "3")
    var botton4 = GFButton(backgroundColor: .darkGray, title: "4")
    var botton5 = GFButton(backgroundColor: .darkGray, title: "5")
    var botton6 = GFButton(backgroundColor: .darkGray, title: "6")
    var botton7 = GFButton(backgroundColor: .darkGray, title: "7")
    var botton8 = GFButton(backgroundColor: .darkGray, title: "8")
    var botton9 = GFButton(backgroundColor: .darkGray, title: "9")
    var botton18 = GFButton(backgroundColor: .darkGray, title: "")
    
    
    var botton10 = GFButton(backgroundColor: .orange, title: "+")
    var botton11 = GFButton(backgroundColor: .orange, title: "-")
    var botton12 = GFButton(backgroundColor: .orange, title: "x")
    var botton13 = GFButton(backgroundColor: .orange, title: "÷")
    var botton14 = GFButton(backgroundColor: .orange, title: "=")
    
    var botton15 = GFButton(backgroundColor: .systemGray3, title: "√", titleColor: .black)
    var botton16 = GFButton(backgroundColor: .systemGray3, title: "C", titleColor: .black)
    var botton17 = GFButton(backgroundColor: .systemGray3, title: "◀︎", titleColor: .black)
    
    let absStackView = GFVerticalStackView()
    
    let stackView = GFHorizontalStackView(edge: 10, spacing: 10)
    let equalStack = GFHorizontalStackView(spacing: 10)
    
    let stackView2 = GFHorizontalStackView(edge: 10, spacing: 10)
    let stackView3 = GFHorizontalStackView(edge: 10, spacing: 10)
    let stackView4 = GFHorizontalStackView(edge: 10, spacing: 10)
    let stackView5 = GFHorizontalStackView(edge: 10, spacing: 10)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        resultLabel.text = "0"
        setupUI()
        addFunctionToNumbers()
        addFunctionToActions()
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .white, title: "", preferredLargeTitle: false)
        setupTableViewButtonInNavBar()
    }
    
    
    func setupTableViewButtonInNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Results", style: .plain, target: self, action: #selector(pushToTableView))
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
        numbers = [botton0,botton1,botton2,botton3,botton4,botton5,botton6,botton7,botton8,botton9]
        numbers?.forEach({ $0.addTarget(self, action: #selector(didTapNumber(_:)), for: .touchUpInside)})
    }
    
    
    func setupUI() {
        view.addSubview(resultLabel)
        view.addSubview(absStackView)
        
        absStackView.addArrangedSubviews(stackView5, stackView4, stackView3, stackView2, stackView)
        
        stackView5.addArrangedSubviews(botton16, botton17, botton15, botton13)
        stackView4.addArrangedSubviews(botton7, botton8, botton9, botton12)
        stackView3.addArrangedSubviews(botton4, botton5, botton6, botton11)
        stackView2.addArrangedSubviews(botton1, botton2, botton3, botton10)
        equalStack.addArrangedSubviews(botton18, botton14)
        stackView.addArrangedSubviews(botton0, equalStack)
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(135)
            make.leading.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(60)
        }
        
        absStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-25)
            make.top.equalTo(resultLabel.snp.bottom).offset(10)
        }
//
//        NSLayoutConstraint.activate([
//            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 135),
//            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            resultLabel.heightAnchor.constraint(equalToConstant: 60),
//
//            absStackView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 10),
//            absStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
//            absStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            absStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
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
        if sender.titleLabel!.text! != "0" && sender.titleLabel!.text! != "C" && sender.titleLabel!.text! != "◀︎" && sender.titleLabel!.text! != "=" &&  sender.titleLabel!.text! != "√" {
            firstNum = Double(resultLabel.text!)!
            operation = sender.titleLabel!.text!
            mathSign = true
        }
            
        else if sender.titleLabel!.text! == "=" {
            afterEqual = true
            var ans = ""
            if numberFromScreen != 0 && firstNum != 0 {
                if operation == "+" {
                    if type(of: firstNum) == type(of: round(firstNum)) && type(of: numberFromScreen) == type(of: round(numberFromScreen)){
                        ans = String(Int(firstNum) + Int(numberFromScreen))
                    }else {
                        ans = String(firstNum + numberFromScreen)
                    }
                }
                else if operation == "-" {
                    if type(of: firstNum) == type(of: round(firstNum)) && type(of: numberFromScreen) == type(of: round(numberFromScreen)){
                        ans = String(Int(firstNum) - Int(numberFromScreen))
                    }else {
                        ans = String(firstNum - numberFromScreen)
                    }
                }
                else if operation == "x" {
                    if type(of: firstNum) == type(of: round(firstNum)) && type(of: numberFromScreen) == type(of: round(numberFromScreen)){
                        ans = String(Int(firstNum) * Int(numberFromScreen))
                    }else {
                        ans = String(firstNum * numberFromScreen)
                    }
                }
                else if operation == "÷" {
                    ans = String(firstNum / numberFromScreen)
                }
                    
            resultLabel.text = ans
            PersitenceManager.updateWith(number: ans)
                         
            }
        }
            
        else if sender.titleLabel!.text! == "√" {
            if resultLabel.text != "0" {
                resultLabel.text = "\(Double(resultLabel.text!)?.squareRoot() ?? 0)"
            }
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
