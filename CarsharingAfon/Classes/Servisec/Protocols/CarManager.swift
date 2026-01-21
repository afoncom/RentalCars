//
//  CarManager.swift
//  CarsharingAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

protocol CarManager {
    func getAllCars() -> [RegularCarImpl]
    func deleteAllCars()
}
