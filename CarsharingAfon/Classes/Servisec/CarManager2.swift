//
//  CarManager2.swift
//  CarsharingAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

class CarManager2: CarManager {
    private var cars: [Car]
    
    init(cars: [Car]) {
        self.cars = cars
    }
    
    func getAllCars() -> [Car] {
        cars
    }
    func deleteAllCars() {
        cars.removeAll()
    }
    
}
