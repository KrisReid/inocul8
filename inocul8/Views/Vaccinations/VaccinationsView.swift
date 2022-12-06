//
//  VaccinationsView.swift
//  inocul8
//
//  Created by Kris Reid on 05/12/2022.
//

import SwiftUI

struct VaccinationsView: View {
    
    @ObservedObject private var vaccinationsVM = VaccinationsViewModel()
        
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Vaccination.timestamp, ascending: false)],
        animation: .default)
    private var vaccinations: FetchedResults<Vaccination>
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                if !vaccinations.isEmpty {
                    ForEach(vaccinations) { vaccination in
                        VaccinationView(vaccination: vaccination)
                            .tag(vaccination.hash)
                    }
                    .padding(.vertical, 10)
                    
                } else {
                    EmptyView(type: "vaccinations")
                }
                Spacer()
                    .fullScreenCover(isPresented: $vaccinationsVM.shouldPresentAddVaccinatioForm, onDismiss: nil) {
                        AddVaccinationFormView(vaccination: nil) { vaccination in
                            vaccinationsVM.selectedVaccinationHash = vaccination.hash
                        }
                    }
            }
            .navigationTitle("Vaccinations")
            .navigationBarItems(trailing: addVaccinationButton)
        }
    }
    
    
    var addVaccinationButton: some View {
        Button(action: {
            vaccinationsVM.shouldPresentAddVaccinatioForm.toggle()
        }, label: {
            AddButtonView()
        })
    }
    
}

struct VaccinationsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.shared.container.viewContext
        VaccinationsView()
            .environment(\.managedObjectContext, viewContext)
    }
}
