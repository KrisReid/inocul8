//
//  AddTravelFormView.swift
//  inocul8
//
//  Created by Kris Reid on 06/12/2022.
//

import SwiftUI

struct AddTravelFormView: View {
    
    @ObservedObject private var addTravelFormVM = AddTravelFormViewModel()
    
    let travel: Travel?
    
    var didAddTravel: ((Travel) -> ())? = nil
    
    init(travel: Travel? = nil, didAddTravel: ((Travel) -> ())? = nil) {
        
        self.travel = travel
        self.didAddTravel = didAddTravel
        
        _destination = State(initialValue: self.travel?.destination ?? "")
        _return_month = State(initialValue: Int(self.travel?.return_month ?? Int16(addTravelFormVM.currentMonth)))
        _return_year = State(initialValue: Int(self.travel?.return_year ?? Int16(addTravelFormVM.currentYear)))
        
    }
    
    @Environment(\.presentationMode) var presentationMode
    @State private var destination = ""
    @State private var return_year = Calendar.current.component(.year, from: Date())
    @State private var return_month = Calendar.current.component(.month, from: Date())
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Destination", selection: $destination) {
                        ForEach(self.addTravelFormVM.countryList, id: \.self) { country in
                            Text(country)
                        }
                    }
                    .pickerStyle(.menu)
                    Picker("Returning Month", selection: $return_month) {
                        ForEach(1..<13, id: \.self) { num in
                            Text(String(num)).tag(String(num))
                        }
                    }
                    Picker("Returning Year", selection: $return_year) {
                        ForEach(addTravelFormVM.currentYear ... addTravelFormVM.currentYear + 11, id: \.self) { num in
                            Text(String(num)).tag(String(num))
                        }
                    }
                } header: {
                    Text("Destination Information")
                        .font(.system(size: 14))
                }
            }
            .navigationTitle("Add Travel")
            .navigationBarItems(leading: DismissButton, trailing: SaveButton)
        }
    }
    
    var DismissButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Cancel")
        })
    }
    
    var SaveButton: some View {
        Button(action: {
            let viewContext = PersistenceController.shared.container.viewContext
            
            //Code to decide if we are editing or adding a new card
            let travel = self.travel != nil ? self.travel! : Travel(context: viewContext)
            
            travel.destination = self.destination
            travel.return_month = Int16(self.return_month)
            travel.return_year = Int16(self.return_year)
            travel.timestamp = Date()
            
            do {
                try viewContext.save()
                presentationMode.wrappedValue.dismiss()
                didAddTravel?(travel)
            } catch {
                print("Failed to persist the new record: \(error)")
            }
        }, label: {
            Text("Save")
        })
    }
    
}

struct AddTravelFormView_Previews: PreviewProvider {
    static var previews: some View {
        AddTravelFormView()
    }
}
