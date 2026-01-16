//
//  CarManagerImpl.swift
//  CarsharingAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

class CarManagerImpl: CarManager {
    private var listCar: [Car]
    
    init(listCar: [Car]) {
        self.listCar = listCar
    }
    
    func getAllCars() -> [Car] {
        listCar
    }
    
    func deleteAllCars() {
        listCar.removeAll()
    }
}
