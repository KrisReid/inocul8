//
//  TravelsView.swift
//  inocul8
//
//  Created by Kris Reid on 06/12/2022.
//

import SwiftUI

struct TravelsView: View {
    
    @ObservedObject private var travelsVM = TravelsViewModel()
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Travel.timestamp, ascending: false)],
        animation: .default)
    private var travels: FetchedResults<Travel>    
    
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                if !travels.isEmpty {
                    ForEach(travels) { travel in
                        TravelView(travel: travel)
                    }
                    .padding(.vertical, 10)
                    
                } else {
                    EmptyView(type: "travels")
                }
                
                Spacer()
                    .fullScreenCover(isPresented: $travelsVM.shouldPresentAddTravelForm) {
                        AddTravelFormView()
                    }
            }
            .navigationTitle("Travels")
            .navigationBarItems(trailing: addTravelButton)
            
        }
        
        
    }
    
    var addTravelButton: some View {
        Button(action: {
            travelsVM.shouldPresentAddTravelForm.toggle()
        }, label: {
            AddButtonView()
        })
    }
}

struct TravelsView_Previews: PreviewProvider {
    static var previews: some View {
        TravelsView()
    }
}
