//
//  TravelView.swift
//  inocul8
//
//  Created by Kris Reid on 06/12/2022.
//

import SwiftUI


struct TravelView: View {
    
    @ObservedObject private var travelVM = TravelViewModel()
    let travel: Travel
    
    var body: some View {
        
        VStack {
            Text("------")
            Text(travel.destination ?? "Gah")
            Text(String(travel.return_month))
            Text(String(travel.return_year))
            
            ForEach(travelVM.countries) { countries in
                Text(countries.name)
                Text(countries.advised)
                Text(countries.id)
            }
            
        }
        .onAppear(perform: {
//            Figure out a way of passing a Sting of comma seperated names here
            travelVM.fetchCountries(names: travel.destination ?? "")
        })
    }
}





struct TravelView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.shared.container.viewContext
        ContentView(viewRouter: ViewRouter())
            .environment(\.managedObjectContext, viewContext)
    }
}
