//
//  City.swift
//  When
//
//  Created by Xiao Ma on 2023-01-21.
//

import Foundation

struct City: Codable {
    var name: String
    var country: String
    var timezone: String
}

extension City: Identifiable {
    var id: String { name }
}

extension City: Equatable {}

extension City {
    static let toronto = City(name: "Toronto", country: "Canada", timezone: "EST")
    static let beijing = City(name: "Beijing", country: "China", timezone: "CST")
    static let london = City(name: "London", country: "UK", timezone: "GMT")
    static let tokyo = City(name: "Tokyo", country: "Japan", timezone: "JST")
    static let queenstown = City(name: "Queenstown", country: "New Zealand", timezone: "NZD")
    static let mockList = [beijing, london, queenstown, tokyo, toronto]
}
