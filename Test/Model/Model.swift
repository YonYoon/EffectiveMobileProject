//
//  Model.swift
//  Test
//
//  Created by Zhansen Zhalel on 08.06.2024.
//

import SwiftUI

class Model: ObservableObject {
    @AppStorage("origin") var origin = ""
    @Published var destination = ""
}
