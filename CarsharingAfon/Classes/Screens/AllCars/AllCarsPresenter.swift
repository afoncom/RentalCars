//
//  AllCarsPresenter.swift
//  CarsharingAfon
//
//  Created by afon.com on 13.01.2026.
//

protocol AllCarsPresenter {
    func loadCars()
    func changeStatusCars(car: Car)
}

final class AllCarsPresenterImpl {
    private let viewModel: AllCarsViewModel
    private let agregator: Agregator
    
    init(
        viewModel: AllCarsViewModel,
        agregator: Agregator
    ) {
        self.viewModel = viewModel
        self.agregator = agregator
    }
}

extension AllCarsPresenterImpl: AllCarsPresenter {
    
    func loadCars() {
        viewModel.allCars = agregator.getAllCars()
    }
    
    func changeStatusCars(car: Car) {
        _ = agregator.rent(brand: car.brand, model: car.model, isRenting: true)
        viewModel.allCars = agregator.getAllCars()
    }
}
