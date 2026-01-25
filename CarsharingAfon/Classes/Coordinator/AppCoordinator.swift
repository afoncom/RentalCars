//
//  AppCoordinator.swift
//  CarsharingAfon
//
//  Created by afon.com on 20.01.2026.
//

import Combine
import SwiftUI

enum Route: Hashable, Equatable {
    case carDetails(String)
    case addCar
}

protocol AllCarsCoordinator {
    func openCarDetails(carId: String)
    func openAddCarView()
}


@MainActor
final class AppCoordinator: ObservableObject, AllCarsCoordinator {
    @Published var path = NavigationPath()
    
    func openCarDetails(carId: String) {
        path.append(Route.carDetails(carId))
    }
    
    func openAddCarView() {
        path.append(Route.addCar)
    }
}


