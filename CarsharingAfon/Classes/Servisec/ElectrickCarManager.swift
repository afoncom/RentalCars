//
//  ElectrickCarManager.swift
//  CarsharingAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

class ElectrickCarManager: CarManager {
    private var cars: [RegularCarImpl]
    
    init(cars: [RegularCarImpl]) {
        self.cars = cars
    }
    
    func getAllCars() -> [RegularCarImpl] {
        cars
    }
    
    func deleteAllCars() {
        cars.removeAll()
    }
}
