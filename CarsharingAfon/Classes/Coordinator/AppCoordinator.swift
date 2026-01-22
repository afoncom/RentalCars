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
}

protocol AllCarsCoordinator {
    func openCarDetails(carId: String)
}

@MainActor
final class AppCoordinator: ObservableObject, AllCarsCoordinator {
    @Published var path = NavigationPath()
    
    func openCarDetails(carId: String) {
        path.append(Route.carDetails(carId))
    }
}


