//
//  WebService.swift
//  inocul8
//
//  Created by Kris Reid on 03/12/2022.
//

import Foundation

class WebService {
    
    
    func getCountries(completion: @escaping ([Country]?) -> Void) {
        let urlString = "http://127.0.0.1:5000/countries"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            guard let data = data else { return }
                  
            DispatchQueue.main.async {
                do {
                    let countries = try JSONDecoder().decode([Country].self, from: data)
                    completion(countries)
                } catch {
                    print("Failed to decode JSON:", error)
                    completion(nil)
                }
            }
        }.resume()
    }
    
    
    
    func getVaccineValidation(country: String, date: String, vaccinations: String, completion: @escaping ([Destination]?) -> Void) {
        let urlString = "http://127.0.0.1:5000/validate?country=\(country)&travel_date=\(date)&vaccinations=\(vaccinations)"

        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            guard let data = data else { return }

            DispatchQueue.main.async {
                do {
                    let country = try JSONDecoder().decode([Destination].self, from: data)
                    completion(country)
                } catch {
                    print("Failed to decode JSON:", error)
                    completion(nil)
                }
            }
        }.resume()
    }
    
    
}
