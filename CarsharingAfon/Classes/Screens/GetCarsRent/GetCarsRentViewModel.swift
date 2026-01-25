//
//  GetCarsRentViewModel.swift
//  CarsharingAfon
//
//  Created by afon.com on 17.01.2026.
//

import Foundation
import Combine

final class GetCarsRentViewModel: ObservableObject {
    @Published var selectedCarId: String
    @Published var selectedCar: RegularCar?
    @Published var viewState: GetCarsRentScreen.ViewState = .loaded
    
    init(selectedCarId: String, selectedCar: RegularCar? = nil) {
        self.selectedCarId = selectedCarId
        self.selectedCar = selectedCar
    }
}
