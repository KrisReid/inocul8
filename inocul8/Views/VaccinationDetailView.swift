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
    let color: Color
    
    var body: some View {
        VStack {
            HStack {
                Text("NAME")
                Spacer()
                Text("DOB")
            }
            .font(.system(size: 14, weight: .light))
            HStack {
                Text("Kris Reid")
                Spacer()
                Text("29-09-1988")
            }
            .font(.system(size: 16, weight: .bold))
        }
        
        VStack {
            VStack {
                HStack {
                    Text("MANUFACTURER")
                    Spacer()
                    Text("DOSE \(dosageNumber)")
                }
                .foregroundColor(color.opacity(0.9))
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
                .foregroundColor(color.opacity(0.9))
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
            color.opacity(0.2)
        )
        .cornerRadius(6)
        .padding(.top, 10)
    }
}

struct VaccinationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.shared.container.viewContext
        ContentView()
            .environment(\.managedObjectContext, viewContext)
    }
}
