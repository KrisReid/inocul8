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
}

extension UIColor {

     class func color(data:Data) -> UIColor? {
          return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor
     }

     func encode() -> Data? {
          return try? NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
     }
}
