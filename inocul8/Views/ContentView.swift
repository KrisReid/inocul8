//
//  ContentView.swift
//  inocul8
//
//  Created by Kris Reid on 06/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Vaccination.timestamp, ascending: false)],
        animation: .default)
    private var vaccinations: FetchedResults<Vaccination>
    
    @State private var shouldPresentAddVaccinatioForm = false
    @State private var selectedVaccinationHash = -1

    var body: some View {
        NavigationView {
            ScrollView {
                if !vaccinations.isEmpty {
                    
                    TabView(selection: $selectedVaccinationHash) {
                        ForEach(vaccinations) { vaccination in
                            VaccinationView(vaccination: vaccination)
                                .padding(.bottom, 50)
                                .tag(vaccination.hash)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(height: 640)
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                    .onAppear {
                        self.selectedVaccinationHash = vaccinations.first?.hash ?? -1
                    }
                    
                } else {
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
            Text("You currently have no vaccinations in the system")
                .padding(.horizontal, 48)
                .padding(.vertical)
                .font(.system(size: 18, weight: .semibold))
                .multilineTextAlignment(.center)
            Button {
                shouldPresentAddVaccinatioForm.toggle()
            } label: {
                Text("+ Add your first vaccination here")
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .padding(EdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14))
                    .background(Color.primary_1)
                    .cornerRadius(4)
            }
        }
    }
    
    var addVaccinationButton: some View {
        Button(action: {
            shouldPresentAddVaccinatioForm.toggle()
        }, label: {
            Text("+ Vaccination")
                .foregroundColor(Color.white)
                .font(.system(size: 16, weight: .bold, design: .default))
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                .background(Color.primary_1)
                .cornerRadius(4)
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
