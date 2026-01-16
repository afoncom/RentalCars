//
//  RegularCarImpl.swift
//  CarsharingAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

class RegularCarImpl: RegularCar {
    let brand: String
    
    let model: String
    let window: Int
    let door: Int
    
    var started: Bool = false
    var isRented: Bool = false
    
    func start() {
        started = true
    }
    
    func stop() {
        started = false
    }
    
    func rent(_ isRented: Bool) {
        self.isRented = isRented
    }
    
    
    init(window: Int, door: Int, brand: String, model: String) {
        self.window = window
        self.door = door
        self.model = model
        self.brand = brand
    }
}
