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
    
    //Hack for refreshing the UI - The issue is that saving from Core Data does not rerednder the screen, but adding this forces that re-render?
    
    @State var refreshId = UUID()
    @State var hadBoosterOne = false
    @State var selectedColor: Color
    
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
            
            
            // MAKE REPEATABLE CODE FOR DOASAGE 2
            VaccinationDetailView(manufacturer: vaccination.dose_one_manufacturer ?? "N/A", location: vaccination.dose_one_location ?? "N/A", administeredMonth: String(vaccination.dose_one_recieved_month), administeredYear: String(vaccination.dose_one_recieved_year), expiresMonth: String(vaccination.dose_one_expires_month), expiresYear: String(vaccination.dose_one_expires_year), dosageNumber: "1", color: Color(UIColor.color(data: vaccination.color!)!))
            
//            Text("\(String(vaccination.recieved_month))- \(String(vaccination.recieved_year))")
//                .font(.system(size: 24, weight: .semibold))
            
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
