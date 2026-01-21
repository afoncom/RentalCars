//
//  CarsharingAfonApp.swift
//  CarsharingAfon
//
//  Created by afon.com on 08.01.2026.
//

import SwiftUI

@main
struct CarsharingAfonApp: App {
    @StateObject private var coordinator = AppCoordinator()
    
    private let carManager1 = CarManagerImpl(
        listCar: [
            RegularCarImpl(window: 4, door: 5, brand: "BMW", model: "M3"),
            RegularCarImpl(window: 4, door: 5, brand: "BMW", model: "X5"),
            RegularCarImpl(window: 4, door: 3, brand: "Audi", model: "A8"),
            RegularCarImpl(window: 4, door: 5, brand: "Audi", model: "A5"),

        ]
    )
    
    private let carManager2 = CarManager2(
        cars: [
            RegularCarImpl(window: 4, door: 5, brand: "Geely", model: "Coolry"),
            RegularCarImpl(window: 4, door: 3, brand: "Tesla", model: "Model3"),
            RegularCarImpl(window: 4, door: 5, brand: "Renault", model: "Logan"),
            RegularCarImpl(window: 4, door: 5, brand: "Lada", model: "Vesta"),
        ]
    )
    
    private let electricCarManager = ElectrickCarManager(cars: [])
    private var carManagers: [CarManager] {
        [carManager1, carManager2, electricCarManager]
    }
    
    private var carStatusProvider: CarStatusProvider {
        CarStatusProviderImpl(carManagers: carManagers)
    }
    
    private var agregator: Agregator {
        AgregatorImpl(carManagers: carManagers)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                AllCarsModule.build(agregator: agregator, coordinator: coordinator)
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .carDetails(let car):
                            GetCarsRentModule.build(car: car)
                        }
                    }
            }
        }
    }
}
