//
//  CarStatusProviderImpl.swift
//  CarsharingAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

class CarStatusProviderImpl: CarStatusProvider {
    private var carManagers: [CarManager]
    
    init(carManagers: [CarManager]) {
        self.carManagers = carManagers
    }
    
    func rentedCars() -> [RegularCarImpl]{
        var isRentCars: [RegularCarImpl] = []
        
        for manager in carManagers {
            for car in manager.getAllCars() {
                if car.isRented {
                    isRentCars.append(car)
                }
            }
        }
        return isRentCars
    }
}
