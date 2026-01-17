//
//  AllCarsViewModel.swift
//  CarsharingAfon
//
//  Created by afon.com on 13.01.2026.
//

import Foundation
import Combine

final class AllCarsViewModel: ObservableObject {
 
    
    @Published var allCars: [any Car] = []
    @Published var showSheet = false
    
}

