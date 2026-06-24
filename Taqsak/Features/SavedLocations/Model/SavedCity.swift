//
//  SavedCity.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 24/06/2026.
//

import Foundation
import SwiftData

@Model
final class SavedCity {
    var id: Int
    var name: String
    var region: String
    var country: String
    var savedAt: Date
    
    init(id: Int, name: String, region: String, country: String) {
        self.id = id
        self.name = name
        self.region = region
        self.country = country
        self.savedAt = Date()
    }
    
    convenience init(from searchCity: SearchCityResult) {
        self.init(
            id: searchCity.id,
            name: searchCity.name,
            region: searchCity.region,
            country: searchCity.country,
        )
    }
}
