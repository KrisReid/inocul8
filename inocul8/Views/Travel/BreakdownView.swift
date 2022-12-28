//
//  BreakdownView.swift
//  inocul8
//
//  Created by Kris Reid on 28/12/2022.
//

import SwiftUI

struct BreakdownView: View {
    
    let items: String
//    let width: CGFloat
    let category: String
    
    var body: some View {
        
        let list = items.stringToArray()
        
        HStack {
            Text("✅")
                .padding(.horizontal, 40)
                .font(.system(size: 30))
            VStack (alignment: .leading) {
                
                Text("\(category)")
                    .font(.system(size: 11, weight: .light))
                    .offset(x: -9)
                    .foregroundColor(.black)
                    .textCase(.uppercase)
                
                ForEach(list, id: \.self) { item in
                    HStack {
                        Text(item)
                        Spacer()
                        Text("✅")
                    }
                    .padding(.vertical, 1)
                    .frame(alignment: .leading)
                }
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.primary_1, lineWidth: 1))
//            .background(
//                Color.primary_1
//            )
//            .cornerRadius(8, corners: [.topLeft, .bottomLeft])
        }


        




    }
    
}

struct BreakdownView_Previews: PreviewProvider {
    static var previews: some View {
        BreakdownView(items: "Hep A; Hep B; Polio.", category: "Advised")
    }
}
