//
//  VaccinationDetailView.swift
//  inocul8
//
//  Created by Kris Reid on 11/11/2022.
//

import SwiftUI

struct VaccinationDetailView: View {
    
    let manufacturer: String
    let location: String
    let administeredMonth: String
    let administeredYear: String
    let expiresMonth: String
    let expiresYear: String
    let dosageNumber: String
    
    var body: some View {
        
        VStack {
            VStack {
                HStack {
                    Text("MANUFACTURER")
                    Spacer()
                    Text("DOSE \(dosageNumber)")
                }
                .foregroundColor(.black)
                .font(.system(size: 14, weight: .light))
                HStack {
                    Text(manufacturer)
                    Spacer()
                    Text("\(administeredMonth)-\(administeredYear)")
                }
                .font(.system(size: 14, weight: .bold))
            }
            .padding(.bottom, 1)
            
            VStack {
                HStack {
                    Text("ISSUED BY")
                    Spacer()
                    Text("EXPIRES")
                }
                .foregroundColor(.black)
                .font(.system(size: 14, weight: .light))
                HStack {
                    Text(location)
                    Spacer()
                    Text("\(expiresMonth)-\(expiresYear)")
                }
                .font(.system(size: 14, weight: .bold))
            }
        }
        .padding(10)
        .background(
            Color.primary_1
        )
        .cornerRadius(14, corners: [.topLeft, .bottomLeft])
        .padding(.top, 8)
    }
}

struct VaccinationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.shared.container.viewContext
        ContentView(viewRouter: ViewRouter())
            .environment(\.managedObjectContext, viewContext)
    }
}
