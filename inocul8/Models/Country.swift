//
//  Country.swift
//  inocul8
//
//  Created by Kris Reid on 03/12/2022.
//

import Foundation

struct Country: Decodable {
    let id: String
    let name: String
    let advised: String
    let consideration: String
    let selectively_advised: String
    let yellow_fever_cert_required: Bool
    let yellow_fever_information: String
    let general_information: String
}
