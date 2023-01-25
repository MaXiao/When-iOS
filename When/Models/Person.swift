//
//  Person.swift
//  When
//
//  Created by Xiao Ma on 2023-01-21.
//

import Foundation

struct Person: Codable {
    var id: UUID
    var name: String
    var city: City

    enum CodingKeys: CodingKey {
        case id
        case name
        case city
    }
}

extension Person: Identifiable {}

extension Person: Equatable {}

extension Person {
    static let mockList = [
        mockX,
        Person(id: UUID(uuidString: "00000000-0000-0000-0000-000000000001")!,
               name: "Huan",
               city: City.beijing)
    ]
    
    static let mockX = Person(id: UUID(uuidString: "00000000-0000-0000-0000-000000000000")!,
                              name: "Xiao",
                              city: City.toronto)
}
