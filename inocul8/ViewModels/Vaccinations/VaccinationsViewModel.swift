//
//  VaccinationsViewModel.swift
//  inocul8
//
//  Created by Kris Reid on 06/12/2022.
//

import Foundation

class VaccinationsViewModel: ObservableObject {
    
    @Published var shouldPresentAddVaccinatioForm = false
    @Published var selectedVaccinationHash = -1
    
}
