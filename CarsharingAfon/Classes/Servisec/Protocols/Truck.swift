//
//  Truck.swift
//  CarsharingAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

protocol Truck: Car {
    var open: Bool { get }
    
    func up()
    func down()
}
