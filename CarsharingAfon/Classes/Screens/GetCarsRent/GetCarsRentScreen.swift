//
//  GetCarsRentScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 17.01.2026.
//

import SwiftUI

struct GetCarsRentScreen: View {
    @ObservedObject private var viewModel: GetCarsRentViewModel
    private let presenter: GetCarsRentPresenter
    
    init(
        viewModel: GetCarsRentViewModel,
        presenter: GetCarsRentPresenter
    ) {
        self.viewModel = viewModel
        self.presenter = presenter
    }
    
    
    
    var body: some View {
        Text (viewModel.selectedCar.brand)
            .presentationDetents([.medium])
    }
}

