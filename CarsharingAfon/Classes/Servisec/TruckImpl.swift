//
//  TruckImpl.swift
//  CarsharingAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

struct TruckImpl: Truck {
    let brand: String
    
    let model: String
    let window: Int
    let door: Int
    
    var open: Bool = false
    var started: Bool = false
    var isRented: Bool = false
    
    init(window: Int, door: Int, brand: String, model: String) {
        self.window = window
        self.door = door
        self.model = model
        self.brand = brand
    }
    
    func start() {
//        started = true
    }
    
    func stop() {
//        started = false
    }
    
    func up() {
//        open = true
    }
    
    func down() {
//        open = false
    }
    
    func rent(_ isRented: Bool) {
//        self.isRented = isRented
    }
}
