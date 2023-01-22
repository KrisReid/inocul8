//
//  AddVaccinationFormViewModel.swift
//  inocul8
//
//  Created by Kris Reid on 28/12/2022.
//

import Foundation

class AddVaccinationFormViewModel: ObservableObject {
    
    @Published var vaccinationsList: [String] = [
        "--------",
        "Diphtheria",
        "Hepatitis B",
        "Meningococcal Meningitis",
        "Rabies",
        "Typhoid",
        "Hepatitis A",
        "Tetanus",
        "Poliomyelitis",
        "Yellow Fever",
        "Tick-borne Encephalitis",
        "Meningococcal Meningitis",
        "Cholera",
        "Japanese Encephalitis",
        "Influenza",
        "COVID-19",
        "MMR"
    ]
        
}

