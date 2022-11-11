//
//  Extensions.swift
//  inocul8
//
//  Created by Kris Reid on 11/11/2022.
//

import Foundation
import SwiftUI

extension Color {
    static let primary = Color("Primary")
}

extension UIColor {

     class func color(data:Data) -> UIColor? {
          return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor
     }

//     func encode() -> Data? {
//          return try? NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
//     }
}
