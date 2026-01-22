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
    
    init(selectedCarId: String) {
        self.selectedCarId = selectedCarId
    }
}
