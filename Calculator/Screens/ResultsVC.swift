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
    var results : [String]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getNumbers()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        configureTableView()
        setupClearButton()
    }
    
    

    func setupClearButton() {
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear All", style: .plain, target: self, action: #selector(clearAll))
    }
    
    
    @objc func clearAll() {
        PersitenceManager.resetDefaults()
        results = ["NO RESULTS"]
        self.tableView.reloadData()
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
    
    
    func getNumbers() {
        PersitenceManager.retrieveResults { [weak self] result in
            guard let self = self else {return}
            
            switch result {
                
            case .success(let results):
                if results.isEmpty {
                    self.results = ["NO RESULTS"]
                } else  {
                    self.results = results
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                        self.view.bringSubviewToFront(self.tableView)
//                    }
                }
                
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}


extension ResultsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = results?[indexPath.row]
        cell.backgroundColor = .black
        cell.textLabel?.textAlignment = .right
        cell.textLabel?.textColor = .white
        return cell
    }
}
