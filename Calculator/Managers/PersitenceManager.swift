//
//  PersitenceManager.swift
//  Calculator
//
//  Created by Shyngys Saktagan on 6/28/20.
//  Copyright © 2020 ShyngysSaktagan. All rights reserved.
//

import Foundation


enum PersitenceManager {
    static private let defaults = UserDefaults.standard
        
    enum Keys {
        static let numbers = "numbers"
    }
    
    static func updateWith(number: String) {
        retrieveResults { result in
            switch result {
            case .success(let numbers):
                var retrievedNumbers = numbers
                
                retrievedNumbers.insert(number, at: 0)

                do {
                    let encoder = JSONEncoder()
                    let encodedNumbers = try encoder.encode(retrievedNumbers)
                    defaults.set(encodedNumbers, forKey: Keys.numbers)
                } catch let error {
                    print("\(error)")
                }
                
            case .failure(let error):
                print("\(error)")
            }
        }
    }
        
        
    static func retrieveResults(completed: @escaping (Result<[String], Error>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.numbers) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([String].self, from: favoritesData)
            completed(.success(favorites))
        } catch let error {
            print("\(error)")
        }
    }
    
    
    static func clearResults(completed: @escaping (Result<[String], Error>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.numbers) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([String].self, from: favoritesData)
            completed(.success(favorites))
        } catch let error {
            print("\(error)")
        }
    }
}
