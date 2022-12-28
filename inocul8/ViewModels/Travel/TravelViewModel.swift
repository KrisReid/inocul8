//
//  TravelViewModel.swift
//  inocul8
//
//  Created by Kris Reid on 28/12/2022.
//

import Foundation

class TravelViewModel: ObservableObject {
    @Published var shouldPresentAddTravelForm = false
    @Published var countries: [CountryViewModel] = [CountryViewModel]()

    func fetchCountries(names: String) {
        WebService().getCountry(ctry: names) { countries in
            if let countries = countries {
                self.countries = countries.map(CountryViewModel.init)
            }
        }
    }
    
}
