//
//  ResultsVC.swift
//  Calculator
//
//  Created by Shyngys Saktagan on 6/28/20.
//  Copyright © 2020 ShyngysSaktagan. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {
    
    var tableView = UITableView()
    var results = ["1", "2", "3"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        configureTableView()
    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        setTableViewDelegates()
        tableView.rowHeight = 80
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    
    func setTableViewDelegates() {
        tableView.dataSource = self
        tableView.delegate   = self
    }
}


extension ResultsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = results[indexPath.row]
        cell.backgroundColor = .black
        cell.textLabel?.textAlignment = .right
        cell.textLabel?.textColor = .white
        return cell
    }
}
