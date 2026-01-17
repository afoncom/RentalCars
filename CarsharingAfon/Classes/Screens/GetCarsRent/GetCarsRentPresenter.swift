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
    
    init(
        viewModel: GetCarsRentViewModel
    ) {
        self.viewModel = viewModel
    }
}

extension GetCarsRentPresenterImpl: GetCarsRentPresenter {
    
}
