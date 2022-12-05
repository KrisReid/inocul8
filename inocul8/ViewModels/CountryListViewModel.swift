//
//  CountryListViewModel.swift
//  inocul8
//
//  Created by Kris Reid on 03/12/2022.
//

import Foundation

class CountryListViewModel: ObservableObject {
    
    @Published var countries: [CountryViewModel] = [CountryViewModel]()

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
