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
        guard
            let bundlePath = Bundle.main.path(forResource: "Monuments", ofType: "json"),
            let optionalJsonData = try? String(contentsOfFile: bundlePath).data(using: .utf8),
            let jsonData = optionalJsonData
                
        else {
            return
        }
        
        guard let response = try? JSONDecoder().decode(MonumentResponse.self, from: jsonData) else {
            return
        }
        
        monuments = response.monuments

        completion(response.monuments)
    }
}
