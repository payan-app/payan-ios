//
//  PYElementSection.swift
//  Payan
//
//  Created by Juan Hurtado on 7/05/22.
//

import Foundation

class PYElementSection {
    let id: String = UUID().uuidString
    var items: [PYElementSectionItem] = []
}

extension PYElementSection: Hashable {
    static func == (lhs: PYElementSection, rhs: PYElementSection) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
