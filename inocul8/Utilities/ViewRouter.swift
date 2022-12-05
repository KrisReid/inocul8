//
//  ViewRouter.swift
//  inocul8
//
//  Created by Kris Reid on 05/12/2022.
//

import Foundation

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .vaccination
}

enum Page {
    case vaccination
    case travel
}
