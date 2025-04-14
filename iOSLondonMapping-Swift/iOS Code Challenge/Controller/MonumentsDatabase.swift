//
//  MonumentsDatabase.swift
//  iOS Code Challenge
//
//  Copyright © 2018 Geektastic. All rights reserved.
//

import Foundation

class MonumentsDatabase {
    
    var monuments: [Monument]?
    
    static let sharedInstance = MonumentsDatabase()
    
    func hasData() -> Bool {
        if let monuments = monuments, monuments.count > 0 {
            return true
        } else {
            return false
        }
    }
    
    func loadMounments(completion: @escaping ([Monument]) -> Void) {
        // Parse monuments from Monuments.json and return an array
    }

}
