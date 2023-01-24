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

extension Group {
    static let mockList = [
        Group(id: UUID(uuidString: "00000000-0000-0000-0000-000000000000")!,
              name: "Game",
              persons: Person.mockList)
    ]
}
