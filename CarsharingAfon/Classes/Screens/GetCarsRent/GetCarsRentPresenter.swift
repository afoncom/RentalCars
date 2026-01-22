//
//  GetCarsRentPresenter.swift
//  CarsharingAfon
//
//  Created by afon.com on 17.01.2026.
//

protocol GetCarsRentPresenter {
    
}

final class GetCarsRentPresenterImpl {
    private let viewModel: GetCarsRentViewModel
    private let agregator: Agregator
    
    init(
        viewModel: GetCarsRentViewModel,
        agregator: Agregator
    ) {
        self.viewModel = viewModel
        self.agregator = agregator
    }
}

extension GetCarsRentPresenterImpl: GetCarsRentPresenter {
    
}
