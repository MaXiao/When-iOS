//
//  Group.swift
//  When
//
//  Created by Xiao Ma on 2023-01-21.
//

import Foundation

struct Group: Codable {
    var id: UUID
    var name: String
    var persons: [Person]
}

extension Group: Identifiable {}

extension Group: Equatable {}
