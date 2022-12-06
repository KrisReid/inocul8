//
//  ContentView.swift
//  inocul8
//
//  Created by Kris Reid on 06/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouter

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                switch viewRouter.currentPage {
                case .vaccination:
                    VaccinationsView()
                case .travel:
                    TravelsView()
                }
                Spacer()
                
                    HStack {
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .vaccination, width: geometry.size.width/2, height: geometry.size.height/22, systemIconName: "pills.circle", tabName: "Vaccinations")

                        TabBarIcon(viewRouter: viewRouter, assignedPage: .travel, width: geometry.size.width/2, height: geometry.size.height/22, systemIconName: "airplane.circle", tabName: "Travel")
                     }
                    .frame(width: geometry.size.width, height: geometry.size.height/8)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}


struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    
    let assignedPage: Page
    let width, height: CGFloat
    let systemIconName: String
    let tabName: String
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -4)
        .onTapGesture {
             viewRouter.currentPage = assignedPage
         }
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color.primary_1 : .gray)
    }
}
