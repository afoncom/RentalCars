//
//  Agregator.swift
//  CarsharingAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

protocol Agregator {
    func getAllCars() -> [RegularCarImpl ]
    func deleteAllCars()
    func rent(brand: String, model: String, isRenting: Bool) -> Bool
    func startStopCar(brand: String, model: String, isStart: Bool) -> Bool
}
