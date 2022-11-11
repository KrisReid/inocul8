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
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 16) {
            HStack {
                Text(vaccination.name ?? "")
                    .font(.system(size: 24, weight: .semibold))
                Spacer()
                Button {
                    shouldShowActionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 24, weight: .bold))
                }
                .actionSheet(isPresented: $shouldShowActionSheet) {
                    .init(title: Text(self.vaccination.name ?? ""), buttons: [
                        .default(Text("Edit"), action: {shouldShowEditForm.toggle()}),
                        .destructive(Text("Delete Vaccination"), action: handleDelete),
                        .cancel()
                    ])
                }
            }
            
//            if vaccination.booster_one_year == 9999 {
//
//            }
//            
//            Text("\(String(vaccination.recieved_month))- \(String(vaccination.recieved_year))")
//                .font(.system(size: 24, weight: .semibold))
//            
//            Text("\(String(vaccination.booster_one_month))- \(String(vaccination.booster_one_year))")
//                .font(.system(size: 24, weight: .semibold))
//            
//            Text("\(String(vaccination.booster_two_month))- \(String(vaccination.booster_two_year))")
//                .font(.system(size: 24, weight: .semibold))
            
        }
        .foregroundColor(.white)
        .padding()
        .background(
            VStack {
                if let colorData = vaccination.color, let uiColor = UIColor.color(data: colorData), let actualColor = Color(uiColor) {
                    
                    LinearGradient(colors: [actualColor.opacity(0.6), actualColor], startPoint: .center, endPoint: .bottom)
                }
                else {
                    Color.cyan
                }
            }
        )
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black.opacity(0.6), lineWidth: 1))
        .cornerRadius(8)
        .shadow(radius: 5)
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
