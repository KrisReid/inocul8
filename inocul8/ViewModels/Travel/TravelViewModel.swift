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
    @Published var destinations: [DesitnationViewModel] = [DesitnationViewModel]()

    func fetchCountries(names: String) {
        WebService().getCountry(ctry: names) { countries in
            if let countries = countries {
                self.countries = countries.map(CountryViewModel.init)
            }
        }
    }
    
    func fetchDestination(country: String, date: String, vaccinations: String) {
        WebService().getVaccineValidation(country: country, date: date, vaccinations: vaccinations, completion: { destinations in
            if let destinations = destinations {
                self.destinations = destinations.map(DesitnationViewModel.init)
            }
        })
    }
    
    
}
