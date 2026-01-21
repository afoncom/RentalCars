//
//  GetCarsRentModule.swift
//  CarsharingAfon
//
//  Created by afon.com on 17.01.2026.
//

import SwiftUI

final class GetCarsRentModule {
    static func build(car: RegularCarImpl) -> some View {
        let viewModel = GetCarsRentViewModel(selectedCar: car)
        let presenter = GetCarsRentPresenterImpl(
            viewModel: viewModel
        )
        
        let view = GetCarsRentScreen(
            viewModel: viewModel,
            presenter: presenter
        )
        return view
    }
}
