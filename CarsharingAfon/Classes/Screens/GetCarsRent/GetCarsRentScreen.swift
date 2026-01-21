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
        VStack {
            VStack(spacing: 12) {
                Text ("Бренд: \(viewModel.selectedCar.brand)")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Марка: \(viewModel.selectedCar.model)")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Двери: \(viewModel.selectedCar.door)")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Окна: \(viewModel.selectedCar.window)")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Статус автомобиля: \(viewModel.selectedCar.isRented ? "В аренде" : "Свободно")")
                    .font(.body)
                    .presentationDetents([.medium])
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            HStack {
                Button(action: {}) {
                    Text ("Взять в аренду")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                }
                .background(.green)
                .cornerRadius(12)
                .padding()
                
                Button(action: {}) {
                    Text ("Вернуть")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                }
                .background(.red)
                .cornerRadius(12)
                .padding()
            }
        }
        
        
    }
}

