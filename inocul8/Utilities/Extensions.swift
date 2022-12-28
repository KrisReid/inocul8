//
//  Extensions.swift
//  inocul8
//
//  Created by Kris Reid on 11/11/2022.
//

import Foundation
import SwiftUI

extension Color {
    static let primary_1 = Color("Primary_1")
    static let accent_1 = Color("Accent_1")
    static let accent_2 = Color("Accent_2")
    static let grey_1 = Color("Grey_1")
    static let grey_2 = Color("Grey_2")
    static let text = Color("Text")
}

extension UIColor {

     class func color(data:Data) -> UIColor? {
          return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor
     }

     func encode() -> Data? {
          return try? NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
     }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


extension String {
    func stringToArray () -> [String] {
        var finalList: [String] = []
        let stringMinusFullStop = self.dropLast()
        let list = stringMinusFullStop.split(separator: ";")
        
        for a in list {
            finalList.append(a.trimmingCharacters(in: .whitespaces))
        }
        return finalList
    }
}
