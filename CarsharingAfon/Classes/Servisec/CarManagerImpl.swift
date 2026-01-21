//
//  CarManagerImpl.swift
//  CarsharingAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

class CarManagerImpl: CarManager {
    private var listCar: [RegularCarImpl]
    
    init(listCar: [RegularCarImpl]) {
        self.listCar = listCar
    }
    
    func getAllCars() -> [RegularCarImpl] {
        listCar
    }
    
    func deleteAllCars() {
        listCar.removeAll()
    }
}
