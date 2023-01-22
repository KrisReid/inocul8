//
//  DestinationViewModel.swift
//  inocul8
//
//  Created by Kris Reid on 12/01/2023.
//

import Foundation

struct DesitnationViewModel: Identifiable {
    
    let destination: Destination
    
    var id: String { return self.destination.id }
    var name: String { return self.destination.name }
    var advised: Dictionary<String, String> { return self.destination.advised }
    var consideration: Dictionary<String, String> { return self.destination.consideration }
    var selectivelyAdvised: Dictionary<String, String> { return self.destination.selectively_advised }
    var yellowFeverCertRequired: Bool { return self.destination.yellow_fever_cert_required }
    var yellowFeverInformation: String { return self.destination.yellow_fever_information }
    var generalInformation: String { return self.destination.general_information }
    
}
