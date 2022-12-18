//
//  TravelView.swift
//  inocul8
//
//  Created by Kris Reid on 06/12/2022.
//

import SwiftUI

struct TravelView: View {
    
//    @ObservedObject private var travelVM = TravelViewModel()
    
    let travel: Travel
    
    var body: some View {
        VStack {
            Text("------")
            Text(travel.destination ?? "Gah")
            Text(String(travel.return_month))
            Text(String(travel.return_year))
        }
    }
}

struct TravelView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.shared.container.viewContext
        ContentView(viewRouter: ViewRouter())
            .environment(\.managedObjectContext, viewContext)
    }
}
