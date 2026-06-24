//
//  WeatherCity.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import Foundation

struct SearchCityResult: Codable, Identifiable {
    let id: Int
    let name: String
    let region: String
    let country: String
}
