//
//  EmptyView.swift
//  inocul8
//
//  Created by Kris Reid on 06/12/2022.
//

import SwiftUI

struct EmptyView: View {
    
    let type: String
    
    var body: some View {
        VStack {
            Text("You currently have no \(type) in the system. Please add your first one by tapping the add button")
                .padding(.vertical, 30)
                .padding(.horizontal)
                .font(.system(size: 18, weight: .light))
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView(type: "vaccinations")
    }
}
