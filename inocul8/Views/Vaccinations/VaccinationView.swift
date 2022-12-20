//
//  VaccinationView.swift
//  inocul8
//
//  Created by Kris Reid on 11/11/2022.
//

import SwiftUI

struct VaccinationView: View {
    
    
    let vaccination: Vaccination
    
    @State var shouldShowActionSheet = false
    @State var shouldShowEditForm = false
    @State var refreshId = UUID()
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 16) {
            HStack {
                Text(vaccination.name ?? "")
                    .font(.system(size: 26, weight: .semibold))
                Spacer()
                Button {
                    shouldShowActionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 20, weight: .bold))
                        .padding()
                }
                .actionSheet(isPresented: $shouldShowActionSheet) {
                    .init(title: Text(self.vaccination.name ?? ""), buttons: [
                        .default(Text("Edit"), action: {shouldShowEditForm.toggle()}),
                        .destructive(Text("Delete Vaccination"), action: handleDelete),
                        .cancel()
                    ])
                }
            }
            .foregroundColor(Color.primary_1)
            
            HStack {
                Spacer()
                VStack {
                    VaccinationDetailView(manufacturer: vaccination.dose_one_manufacturer ?? "N/A", location: vaccination.dose_one_location ?? "N/A", administeredMonth: String(vaccination.dose_one_recieved_month), administeredYear: String(vaccination.dose_one_recieved_year), expiresMonth: String(vaccination.dose_one_expires_month), expiresYear: String(vaccination.dose_one_expires_year), dosageNumber: "1")
                    
                    if vaccination.dose_two_expires_year != 9999 {
                        VaccinationDetailView(manufacturer: vaccination.dose_two_manufacturer ?? "N/A", location: vaccination.dose_two_location ?? "N/A", administeredMonth: String(vaccination.dose_two_recieved_month), administeredYear: String(vaccination.dose_two_recieved_year), expiresMonth: String(vaccination.dose_two_expires_month), expiresYear: String(vaccination.dose_two_expires_year), dosageNumber: "2")
                    }
                    
                    if vaccination.dose_three_expires_year != 9999 {
                        VaccinationDetailView(manufacturer: vaccination.dose_three_manufacturer ?? "N/A", location: vaccination.dose_three_location ?? "N/A", administeredMonth: String(vaccination.dose_three_recieved_month), administeredYear: String(vaccination.dose_three_recieved_year), expiresMonth: String(vaccination.dose_three_expires_month), expiresYear: String(vaccination.dose_three_expires_year), dosageNumber: "2")
                    }
                }
                .padding(.bottom, 4)
            }
            .foregroundColor(.white)

            
            
        }
        .padding(.vertical, 12)
        .padding(.leading, 12)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.primary_1, lineWidth: 1))
        .padding(.horizontal)
        .fullScreenCover(isPresented: $shouldShowEditForm) {
            AddVaccinationFormView(vaccination: self.vaccination)
        }
        
    }
    
    func handleDelete() {
        let viewContext = PersistenceController.shared.container.viewContext
        viewContext.delete(vaccination)
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
    
}

struct VaccinationView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.shared.container.viewContext
        ContentView(viewRouter: ViewRouter())
            .environment(\.managedObjectContext, viewContext)
    }
}
