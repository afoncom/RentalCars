//
//  AllCarsScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 08.01.2026.
//

import SwiftUI

struct AllCarsScreen: View {
    @ObservedObject private var viewModel: AllCarsViewModel
    private let presenter: AllCarsPresenter
    
    init(
        viewModel: AllCarsViewModel,
        presenter: AllCarsPresenter
    ) {
        self.viewModel = viewModel
        self.presenter = presenter
    }
    
    
    var body: some View {
        NavigationView {
            List(Array(viewModel.allCars.enumerated()), id: \.offset) { index, car in
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(car.brand) \(car.model)")
                        .font(.headline)
                    HStack {
                        Text("Окна: \(car.window),  Двери: \(car.door)")
                            .font(.subheadline)
                        Spacer()
                        Text(car.isRented ? "Сдано" : "Свободно")
                            .font(.caption)
                            .foregroundColor(car.isRented ? .red : .green)
                    }
                }
            }
            .navigationTitle("Все автомобили")
        }
    }
}

#Preview {
    AllCarsScreen(
        viewModel: AllCarsViewModel(),
        presenter: AllCarsPresenterImpl(
            viewModel: AllCarsViewModel(),
            agregator: AgregatorStub()
        )
    )
}

fileprivate class AgregatorStub: Agregator {
    func getAllCars() -> [any Car] {
        []
    }
    
    func deleteAllCars() {

    }
    
    func rent(brand: String, model: String, isRenting: Bool) -> Bool {
        true
    }
    
    func startStopCar(brand: String, model: String, isStart: Bool) -> Bool {
        true
    }
}


