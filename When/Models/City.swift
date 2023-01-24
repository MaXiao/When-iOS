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
    static let toronto = City(name: "Toronto", country: "Canada", timezone: "America/Toronto")
    static let beijing = City(name: "Beijing", country: "China", timezone: "Asia/Shanghai")
    static let london = City(name: "London", country: "UK", timezone: "Europe/London")
    static let tokyo = City(name: "Tokyo", country: "Japan", timezone: "Asia/Tokyo")
    static let queenstown = City(name: "Queenstown", country: "New Zealand", timezone: "Pacific/Auckland")
    static let mockList = [beijing, london, queenstown, tokyo, toronto]
}
