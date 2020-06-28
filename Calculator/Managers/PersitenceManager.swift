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
        retrieveFavorites { result in
            switch result {
            case .success(let numbers):
                var retrievedFavorites = numbers
                
                retrievedFavorites.append(number)

                do {
                    let encoder = JSONEncoder()
                    let encodedFavorites = try encoder.encode(retrievedFavorites)
                    defaults.set(encodedFavorites, forKey: Keys.numbers)
                } catch let error {
                    print("1")
                }
                
            case .failure(let error):
                print("2")
            }
        }
    }
        
        
    static func retrieveFavorites(completed: @escaping (Result<[String], Error>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.numbers) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([String].self, from: favoritesData)
            completed(.success(favorites))
        } catch let error {
            print("3")
        }
    }
}
