//
//  GetCarsRentViewModel.swift
//  CarsharingAfon
//
//  Created by afon.com on 17.01.2026.
//

import Foundation
import Combine

final class GetCarsRentViewModel: ObservableObject {
    @Published var selectedCar: RegularCarImpl
    
    init(selectedCar: RegularCarImpl) {
        self.selectedCar = selectedCar
    }
}
