//
//  TravelViewModel.swift
//  inocul8
//
//  Created by Kris Reid on 28/12/2022.
//

import Foundation

class TravelViewModel: ObservableObject {
    @Published var shouldPresentAddTravelForm = false
    @Published var destinations: [DesitnationViewModel] = [DesitnationViewModel]()
    
    func fetchDestination(country: String, date: String, vaccinations: String) {
        WebService().getVaccineValidation(country: country, date: date, vaccinations: vaccinations) { destinations in
            if let destinations = destinations {
                self.destinations = destinations.map(DesitnationViewModel.init)
            }
        }
    }
    
}
