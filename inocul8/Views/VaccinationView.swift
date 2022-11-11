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
                    .font(.system(size: 40, weight: .light))
                Spacer()
                Button {
                    shouldShowActionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 20, weight: .bold))
                }
                .actionSheet(isPresented: $shouldShowActionSheet) {
                    .init(title: Text(self.vaccination.name ?? ""), buttons: [
                        .default(Text("Edit"), action: {shouldShowEditForm.toggle()}),
                        .destructive(Text("Delete Vaccination"), action: handleDelete),
                        .cancel()
                    ])
                }
            }
            
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
            
            VaccinationDetailView(manufacturer: vaccination.dose_one_manufacturer ?? "N/A", location: vaccination.dose_one_location ?? "N/A", administeredMonth: String(vaccination.dose_one_recieved_month), administeredYear: String(vaccination.dose_one_recieved_year), expiresMonth: String(vaccination.dose_one_expires_month), expiresYear: String(vaccination.dose_one_expires_year), dosageNumber: "1", color: Color(UIColor.color(data: vaccination.color!)!))
            
            if vaccination.dose_two_expires_year != 9999 {
                VaccinationDetailView(manufacturer: vaccination.dose_two_manufacturer ?? "N/A", location: vaccination.dose_two_location ?? "N/A", administeredMonth: String(vaccination.dose_two_recieved_month), administeredYear: String(vaccination.dose_two_recieved_year), expiresMonth: String(vaccination.dose_two_expires_month), expiresYear: String(vaccination.dose_two_expires_year), dosageNumber: "2", color: Color(UIColor.color(data: vaccination.color!)!))
            }
            
            HStack {
                Spacer()
                QRCodeView()
                Spacer()
            }
            
        }
        .foregroundColor(.white)
        .padding()
        .background(
            VStack {
                if let colorData = vaccination.color, let uiColor = UIColor.color(data: colorData), let actualColor = Color(uiColor) {
                    actualColor
                        .opacity(0.4)
                }
                else {
                    Color.cyan
                }
            }
        )
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black.opacity(0.6), lineWidth: 1))
        .cornerRadius(8)
        .padding(.horizontal)
        .padding(.top, 10)
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
        ContentView()
            .environment(\.managedObjectContext, viewContext)
//        VaccinationView()
    }
}
