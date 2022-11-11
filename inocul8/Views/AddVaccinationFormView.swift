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
        if let data = self.vaccination?.color, let uiColor = UIColor.color(data: data) {
            let c = Color(uiColor)
            _color = State(initialValue: c)
        }
        _dose_one_location = State(initialValue: self.vaccination?.dose_one_location ?? "")
        _dose_one_manufacturer = State(initialValue: self.vaccination?.dose_one_manufacturer ?? "")
        _dose_one_recieved_month = State(initialValue: Int(self.vaccination?.dose_one_recieved_month ?? Int16(currentMonth)))
        _dose_one_recieved_year = State(initialValue: Int(self.vaccination?.dose_one_recieved_year ?? Int16(currentYear)))
        _dose_one_expires_month = State(initialValue: Int(self.vaccination?.dose_one_expires_month ?? Int16(currentMonth)))
        _dose_one_expires_year = State(initialValue: Int(self.vaccination?.dose_one_expires_year ?? Int16(currentYear) + 5))
        _dose_two_location = State(initialValue: self.vaccination?.dose_two_location ?? "")
        _dose_two_manufacturer = State(initialValue: self.vaccination?.dose_two_manufacturer ?? "")
        _dose_two_recieved_month = State(initialValue: Int(self.vaccination?.dose_two_recieved_month ?? 1))
        _dose_two_recieved_year = State(initialValue: Int(self.vaccination?.dose_two_recieved_year ?? Int16(currentYear)))
        _dose_two_expires_month = State(initialValue: Int(self.vaccination?.dose_two_expires_month ?? 12))
        _dose_two_expires_year = State(initialValue: Int(self.vaccination?.dose_two_expires_year ?? 9999))
    }
    
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var color = Color.blue
    @State private var dose_one_recieved_year = Calendar.current.component(.year, from: Date())
    @State private var dose_one_recieved_month = Calendar.current.component(.month, from: Date())
    @State private var dose_one_expires_year = Calendar.current.component(.year, from: Date())
    @State private var dose_one_expires_month = Calendar.current.component(.month, from: Date())
    @State private var dose_one_location = ""
    @State private var dose_one_manufacturer = ""
    @State private var dose_two_recieved_year = Calendar.current.component(.year, from: Date())
    @State private var dose_two_recieved_month = Calendar.current.component(.month, from: Date())
    @State private var dose_two_expires_year = Calendar.current.component(.year, from: Date())
    @State private var dose_two_expires_month = Calendar.current.component(.month, from: Date())
    @State private var dose_two_location = ""
    @State private var dose_two_manufacturer = ""
    
    let currentYear = Calendar.current.component(.year, from: Date())
    let currentMonth = Calendar.current.component(.month, from: Date())
    
    @State private var showBoosterOne = false
    @State private var showBoosterTwo = false
    
    @State private var showDosageTwo = false

    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                } header: {
                    Text("Vaccination Info")
                        .font(.system(size: 14))
                }
                Section {
                    TextField("Location Recieved", text: $dose_one_location)
                    Picker("Recieved Month", selection: $dose_one_recieved_month) {
                        ForEach(1..<13, id: \.self) { num in
                            Text(String(num)).tag(String(num))
                        }
                    }
                    Picker("Recieved Year", selection: $dose_one_recieved_year) {
                        ForEach(currentYear - 80..<currentYear + 1, id: \.self) { num in
                            Text(String(num)).tag(String(num))
                        }
                    }
                    Picker("Expired Month", selection: $dose_one_expires_month) {
                        ForEach(1..<13, id: \.self) { num in
                            Text(String(num)).tag(String(num))
                        }
                    }
                    Picker("Expired Year", selection: $dose_one_expires_year) {
                        ForEach(currentYear - 80..<currentYear + 11, id: \.self) { num in
                            Text(String(num)).tag(String(num))
                        }
                    }
                    
                } header: {
                    Text("Dosage 1 Info")
                        .font(.system(size: 14))
                }
                
                
                Section {
                    if showDosageTwo {
                        TextField("Location Recieved", text: $dose_two_location)
                        Picker("Recieved Month", selection: $dose_two_recieved_month) {
                            ForEach(1..<13, id: \.self) { num in
                                Text(String(num)).tag(String(num))
                            }
                        }
                        Picker("Recieved Year", selection: $dose_two_recieved_year) {
                            ForEach(currentYear - 80..<currentYear + 1, id: \.self) { num in
                                Text(String(num)).tag(String(num))
                            }
                        }
                        Picker("Expired Month", selection: $dose_two_expires_month) {
                            ForEach(1..<13, id: \.self) { num in
                                Text(String(num)).tag(String(num))
                            }
                        }
                        Picker("Expired Year", selection: $dose_two_expires_year) {
                            ForEach(currentYear - 80..<currentYear + 11, id: \.self) { num in
                                Text(String(num)).tag(String(num))
                            }
                        }
                        
//                        Toggle(isOn: $showBoosterTwo) {
//                            Text("+ another booster")
//                        }
//                        .toggleStyle(.button)
//                        .tint(.blue)
                    }
                        
                } header: {
                    Toggle(isOn: $showDosageTwo) {
                        Text("Dosage 2 Info")
                            .font(.system(size: 14))
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
                }
                
                
//                if showBoosterTwo && showBoosterOne {
//                    Section {
//                        Picker("Booster Month", selection: $booster_two_month) {
//                            ForEach(1..<13, id: \.self) { num in
//                                Text(String(num)).tag(String(num))
//                            }
//                        }
//                        Picker("Year", selection: $booster_two_year) {
//                            ForEach(currentYear - 80..<currentYear + 11, id: \.self) { num in
//                                Text(String(num)).tag(String(num))
//                            }
//                        }
//                    } header: {
//                        Text("Booster 2")
//                            .font(.system(size: 14))
//                    }
//                }
                
                Section {
                    ColorPicker("Color", selection: $color)
                } header: {
                    Text("Colour")
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
            let viewContext = PersistenceController.shared.container.viewContext
            
            //Code to decide if we are editing or adding a new card
            let vaccination = self.vaccination != nil ? self.vaccination! : Vaccination(context: viewContext)
            
//            vaccination.name = self.name
//            vaccination.location = self.location
//            vaccination.recieved_month = Int16(self.recieved_month)
//            vaccination.recieved_year = Int16(self.recieved_year)
//            vaccination.recieved_duration = self.recieved_duration
//            vaccination.booster_one_month = Int16(self.booster_one_month)
//            vaccination.booster_one_year = Int16(self.booster_one_year)
//            vaccination.booster_two_month = Int16(self.booster_two_month)
//            vaccination.booster_two_year = Int16(self.booster_two_year)
//            vaccination.color = UIColor(self.color).encode()
//            vaccination.timestamp = Date()
            
            do {
                try viewContext.save()
                presentationMode.wrappedValue.dismiss()
                didAddVaccination?(vaccination)
            } catch {
                print("Failed to persist the new record: \(error)")
            }
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
