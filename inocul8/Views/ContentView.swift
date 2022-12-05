//
//  ContentView.swift
//  inocul8
//
//  Created by Kris Reid on 06/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var countryListVM = CountryListViewModel()
    
//    Move these into the View Controller
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Vaccination.timestamp, ascending: false)],
        animation: .default)
    private var vaccinations: FetchedResults<Vaccination>
    @State private var shouldPresentAddVaccinatioForm = false
    @State private var selectedVaccinationHash = -1
    
    
    init() {
        countryListVM.load()
    }
    

    var body: some View {
        NavigationView {
            ScrollView {
                if !vaccinations.isEmpty {
//                    ForEach(vaccinations) { vaccination in
//                        VaccinationView(vaccination: vaccination)
//                            .tag(vaccination.hash)
//                    }
//                    .padding(.vertical, 10)
                    
                    ForEach(self.countryListVM.countries, id:\.id) { country in
//                        Text(country.name)
//                            .foregroundColor(Color.primary_1)
                        Text(country.generalInformation)
                    }
                    
                } else {
                    
                    // Add in the ability to add and store your name and DOB before continuing with adding a vaccination.
                    
                    emptyPromptMessage
                }
                Spacer()
                    .fullScreenCover(isPresented: $shouldPresentAddVaccinatioForm, onDismiss: nil) {
                        AddVaccinationFormView(vaccination: nil) { vaccination in
                            self.selectedVaccinationHash = vaccination.hash
                        }
                    }
            }
            .navigationTitle("Vaccinations")
            .navigationBarItems(trailing: addVaccinationButton)
        }
    }
    
    var emptyPromptMessage: some View {
        VStack {
            Text("You currently have no vaccinations in the system. Please add your first one by tapping the add button")
                .padding(.vertical, 30)
                .padding(.horizontal)
                .font(.system(size: 18, weight: .light))
        }
    }
    
    var addVaccinationButton: some View {
        Button(action: {
            shouldPresentAddVaccinatioForm.toggle()
        }, label: {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 28))
                .frame(width: 50, height: 50)
                .foregroundColor(Color.primary_1)
        })
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.shared.container.viewContext
        ContentView()
            .environment(\.managedObjectContext, viewContext)
        
    }
}
