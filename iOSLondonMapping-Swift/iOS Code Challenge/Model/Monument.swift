//
//  Monument.swift
//  iOS Code Challenge
//
//  Copyright © 2018 Geektastic. All rights reserved.
//

import Foundation

struct MonumentResponse: Decodable {
    let monuments: [Monument]
}

struct Monument: Decodable {
    
    let name: String
    let location: String
    let latitude: String
    let longitude: String
    
}
