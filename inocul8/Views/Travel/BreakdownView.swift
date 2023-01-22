//
//  BreakdownView.swift
//  inocul8
//
//  Created by Kris Reid on 28/12/2022.
//

import SwiftUI

struct BreakdownView: View {
    
    let items: Dictionary<String, String>
    let category: String
    
    @State var valid = true
    
    var body: some View {
                
        HStack {
            Text(valid ? "✅" : "⚠️")
                .padding(.horizontal, 40)
                .font(.system(size: 30))
            VStack (alignment: .leading) {
                
                Text("\(category)")
                    .font(.system(size: 11, weight: .light))
                    .offset(x: -9)
                    .foregroundColor(.black)
                    .textCase(.uppercase)
                
                ForEach(items.keys.sorted(), id: \.self) { key in
                    HStack {
                        Text(key)
                        Spacer()
                        if(key == "none") {
                            Text("✅")
                        } else {
                            if (items[key]! == "valid") {
                                Text("✅")
                            } else {
                                Text("⚠️")
                                    .onAppear(perform: {
                                        valid = false
                                    })
                            }
                        }
                    }
                    .padding(.vertical, 1)
                    .frame(alignment: .leading)
                }
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.primary_1, lineWidth: 1))
        }

    }
    
}

struct BreakdownView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleDict = ["Hepatitus A": "valid", "Hepatitus B": "invalid", "Polio": "valid"]
        BreakdownView(items: sampleDict, category: "Advised")
    }
}
