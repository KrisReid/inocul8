//
//  AddVaccinationFormView.swift
//  inocul8
//
//  Created by Kris Reid on 11/11/2022.
//

import SwiftUI

struct AddVaccinationFormView: View {
    
    //Code to optionally pass in data to this view
    let vaccination: Vaccination?
    
    //Optional Callback closure to show if a card was added
    var didAddVaccination: ((Vaccination) -> ())? = nil
    
    init(vaccination: Vaccination? = nil, didAddVaccination: ((Vaccination) -> ())? = nil) {
        self.vaccination = vaccination
        self.didAddVaccination = didAddVaccination
        
        //How to use the values to populate the state variables
        _name = State(initialValue: self.vaccination?.name ?? "")
        _location = State(initialValue: self.vaccination?.location ?? "")
        
        _recieved_month = State(initialValue: Int(self.vaccination?.recieved_month ?? Int16(currentMonth)))
        _recieved_year = State(initialValue: Int(self.vaccination?.recieved_year ?? Int16(currentYear)))
        
        _booster_one_month = State(initialValue: Int(self.vaccination?.booster_one_month ?? 1))
        _booster_one_year = State(initialValue: Int(self.vaccination?.booster_one_year ?? 9999))
        
        _booster_two_month = State(initialValue: Int(self.vaccination?.booster_two_month ?? 1))
        _booster_two_year = State(initialValue: Int(self.vaccination?.booster_two_year ?? 9999))
        
        if let data = self.vaccination?.color, let uiColor = UIColor.color(data: data) {
            let c = Color(uiColor)
            _color = State(initialValue: c)
        }
    }
    
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var location = ""
    @State private var recieved_year = Calendar.current.component(.year, from: Date())
    @State private var recieved_month = Calendar.current.component(.month, from: Date())
    @State private var booster_one_year = Calendar.current.component(.year, from: Date())
    @State private var booster_one_month = Calendar.current.component(.month, from: Date())
    @State private var booster_two_year = Calendar.current.component(.year, from: Date())
    @State private var booster_two_month = Calendar.current.component(.month, from: Date())
    @State private var color = Color.blue
    
    let currentYear = Calendar.current.component(.year, from: Date())
    let currentMonth = Calendar.current.component(.month, from: Date())
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("Location", text: $location)
                    Picker("Recieved Month", selection: $recieved_month) {
                        ForEach(1..<13, id: \.self) { num in
                            Text(String(num)).tag(String(num))
                        }
                    }
                    Picker("Recieved Year", selection: $recieved_year) {
                        ForEach(currentYear..<currentYear - 12, id: \.self) { num in
                            Text(String(num)).tag(String(num))
                        }
                    }
                } header: {
                    Text("Card Info")
                }
                
                
            }
            .navigationTitle("Add Vaccination")
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
            print("DDDD")

        }, label: {
            Text("Save")
        })
    }
}

struct AddVaccinationFormView_Previews: PreviewProvider {
    static var previews: some View {
        AddVaccinationFormView()
    }
}
