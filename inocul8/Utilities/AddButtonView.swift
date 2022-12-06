//
//  AddButtonView.swift
//  inocul8
//
//  Created by Kris Reid on 06/12/2022.
//

import SwiftUI

struct AddButtonView: View {
    var body: some View {
        Image(systemName: "plus.circle.fill")
            .font(.system(size: 28))
            .frame(width: 50, height: 50)
            .foregroundColor(Color.primary_1)
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView()
    }
}
