//
//  TravelVIew.swift
//  inocul8
//
//  Created by Kris Reid on 06/12/2022.
//

import SwiftUI

struct TravelVIew: View {
    
    @ObservedObject private var travelVM = TravelViewModel()
    
    init() {
        travelVM.load()
    }
    
    var body: some View {
        ScrollView {
            ForEach(self.travelVM.countries, id:\.id) { country in
                Text(country.name)
                    .foregroundColor(Color.primary_1)
            }
        }
    }
}

struct TravelVIew_Previews: PreviewProvider {
    static var previews: some View {
        TravelVIew()
    }
}
