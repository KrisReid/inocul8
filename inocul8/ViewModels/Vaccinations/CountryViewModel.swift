//
//  CountryViewModel.swift
//  inocul8
//
//  Created by Kris Reid on 03/12/2022.
//

import Foundation

struct CountryViewModel: Identifiable {
    
    let country: Country
    
    var id: String { return self.country.id }
    var name: String { return self.country.name }
    var advised: String { return self.country.advised }
    var consideration: String { return self.country.consideration }
    var selectivelyAdvised: String { return self.country.selectively_advised }
    var yellowFeverCertRequired: Bool { return self.country.yellow_fever_cert_required }
    var yellowFeverInformation: String { return self.country.yellow_fever_information }
    var generalInformation: String { return self.country.general_information }
    
}



