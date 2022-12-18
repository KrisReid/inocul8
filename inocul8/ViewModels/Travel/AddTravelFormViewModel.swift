//
//  AddTravelFormViewModel.swift
//  inocul8
//
//  Created by Kris Reid on 06/12/2022.
//

import Foundation

class AddTravelFormViewModel: ObservableObject {
    
    @Published var countries: [CountryViewModel] = [CountryViewModel]()
//    @Published var destination = ""
//    @Published var return_month = Calendar.current.component(.year, from: Date())
//    @Published var return_year = Calendar.current.component(.year, from: Date())
    @Published var currentYear = Calendar.current.component(.year, from: Date())
    @Published var currentMonth = Calendar.current.component(.month, from: Date())


    func load() {
        fetchCountries()
    }

    private func fetchCountries() {
        WebService().getCountries { countries in
            if let countries = countries {
                self.countries = countries.map(CountryViewModel.init)
            }
        }
    }
    
}
