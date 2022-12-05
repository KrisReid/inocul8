//
//  inocul8App.swift
//  inocul8
//
//  Created by Kris Reid on 06/11/2022.
//

import SwiftUI

@main
struct inocul8App: App {
    
    @StateObject var viewRouter = ViewRouter()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
