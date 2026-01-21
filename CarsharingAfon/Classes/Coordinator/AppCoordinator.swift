//
//  AppCoordinator.swift
//  CarsharingAfon
//
//  Created by afon.com on 20.01.2026.
//

import Combine
import SwiftUI

enum Route: Hashable, Equatable {
    case carDetails(RegularCarImpl)
}

protocol AllCarsCoordinator {
    func openCarDetails(car: RegularCarImpl)
}

@MainActor
final class AppCoordinator: ObservableObject, AllCarsCoordinator {
    @Published var path = NavigationPath()
    
    func openCarDetails(car: RegularCarImpl) {
        path.append(Route.carDetails(car))
    }
}


