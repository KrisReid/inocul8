//
//  TravelCountry.swift
//  inocul8
//
//  Created by Kris Reid on 03/01/2023.
//

import Foundation

struct Destination: Decodable {
    let id: String
    let name: String
    let advised: Dictionary<String, String>
    let consideration: Dictionary<String, String>
    let selectively_advised: Dictionary<String, String>
    let yellow_fever_cert_required: Bool
    let yellow_fever_information: String
    let general_information: String
}
