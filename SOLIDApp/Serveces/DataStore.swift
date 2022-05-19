//
//  DataStore.swift
//  SOLIDApp
//
//  Created by Martynov Evgeny on 16.05.22.
//

import Foundation

final class DataStore {
    
    static let shared = DataStore()
    private init() {}
    
    func saveName(name: String) {
        print(name)
    }
    
    func getName() -> String {
        return "Some Value"
    }
}
