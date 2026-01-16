//
//  AllCarsPresenter.swift
//  CarsharingAfon
//
//  Created by afon.com on 13.01.2026.
//

protocol AllCarsPresenter {
    
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
        
        viewModel.allCars = agregator.getAllCars()
    }
}

extension AllCarsPresenterImpl: AllCarsPresenter {
    
}
