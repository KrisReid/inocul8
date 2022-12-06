//
//  EmptyVaccinationView.swift
//  inocul8
//
//  Created by Kris Reid on 06/12/2022.
//

import SwiftUI

struct EmptyVaccinationView: View {
    var body: some View {
        VStack {
            Text("You currently have no vaccinations in the system. Please add your first one by tapping the add button")
                .padding(.vertical, 30)
                .padding(.horizontal)
                .font(.system(size: 18, weight: .light))
        }
    }
}

struct EmptyVaccinationView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyVaccinationView()
    }
}
