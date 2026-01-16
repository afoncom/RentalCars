//
//  Car.swift
//  CarsharingAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

protocol Car: AnyObject {
    var brand: String { get }
    var model: String { get }
    var window: Int { get }
    var door: Int { get }
    var started: Bool { get }
    var isRented: Bool { get }
    func start()
    func stop()
    func rent(_ isRented: Bool)
}
