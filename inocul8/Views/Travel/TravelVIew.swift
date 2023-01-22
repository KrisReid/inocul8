//
//  TravelView.swift
//  inocul8
//
//  Created by Kris Reid on 06/12/2022.
//

import SwiftUI


struct TravelView: View {
    
    @ObservedObject private var travelVM = TravelViewModel()
    
    @State var shouldShowActionSheet = false
    @State var shouldShowEditForm = false

    let travel: Travel
    let vaccinations: FetchedResults<Vaccination>
    
    
    var body: some View {
            
        VStack (alignment: .leading) {
            ForEach(travelVM.destinations) { destination in
                
                HStack {
                    Text(destination.name)
                        .font(.system(size: 26, weight: .semibold))
                    Spacer()
                    Button {
                        shouldShowActionSheet.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.system(size: 20, weight: .bold))
                            .padding()
                    }
                    .actionSheet(isPresented: $shouldShowActionSheet) {
                        .init(title: Text(self.travel.destination ?? ""), buttons: [
                            .default(Text("Edit"), action: {shouldShowEditForm.toggle()}),
                            .destructive(Text("Delete Vaccination"), action: handleDelete),
                            .cancel()
                        ])
                    }
   
                }
                .padding(.leading)

                Text(String("\(String(format: "%02d", travel.return_month))-\(travel.return_year)"))
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.leading)
                
                
                BreakdownView(items: destination.advised, category: "Advised")
                BreakdownView(items: destination.consideration, category: "Considerations")
                BreakdownView(items: destination.selectivelyAdvised, category: "Selectively Advised")
//

                Text(destination.yellowFeverInformation)
                    .padding(.horizontal)
                    .padding(.top, 10)
            }
        }
        .font(.system(size: 14, weight: .light))
        .foregroundColor(Color.primary_1)
        .padding(.vertical)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.primary_1, lineWidth: 1))
        .padding(.horizontal)
        .onAppear(perform: {
            travelVM.fetchDestination(country: travel.destination ?? "", date: "\(travel.return_year)-\(String(format: "%02d", travel.return_month))", vaccinations: "Hepatitis%20A:2022-07,Tetanus:2026-09,Hepatitis%20B:2021-07")
        })
        .fullScreenCover(isPresented: $shouldShowEditForm) {
            AddTravelFormView(travel: self.travel)
        }
    }
    
    func handleDelete() {
        let viewContext = PersistenceController.shared.container.viewContext
        viewContext.delete(travel)
        do {
            try viewContext.save()
        } catch {
            print(error)
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
