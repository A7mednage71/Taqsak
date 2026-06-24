//
//  PopularCity.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import Foundation

enum PopularCity: String, CaseIterable, Identifiable {

    case cairo
    case alexandria
    case luxor
    case aswan
    case hurghada
    
    case riyadh
    case jeddah
    case dubai
    case abuDhabi
    case doha
    case kuwaitCity
    case marrakech
    case beirut
    

    case london
    case paris
    case rome
    case tokyo
    case newYork
    case losAngeles
    case singapore
    case sydney


    var id: String { self.rawValue }

    var name: String {
        switch self {
        case .cairo: return "Cairo"
        case .alexandria: return "Alexandria"
        case .luxor: return "Luxor"
        case .aswan: return "Aswan"
        case .hurghada: return "Hurghada"
        case .riyadh: return "Riyadh"
        case .jeddah: return "Jeddah"
        case .dubai: return "Dubai"
        case .abuDhabi: return "Abu Dhabi"
        case .doha: return "Doha"
        case .kuwaitCity: return "Kuwait City"
        case .marrakech: return "Marrakech"
        case .beirut: return "Beirut"
        case .london: return "London"
        case .paris: return "Paris"
        case .rome: return "Rome"
        case .tokyo: return "Tokyo"
        case .newYork: return "New York"
        case .losAngeles: return "Los Angeles"
        case .singapore: return "Singapore"
        case .sydney: return "Sydney"
        }
    }

    var flag: String {
        switch self {
        case .cairo, .alexandria, .luxor, .aswan, .hurghada: return "🇪🇬"
        case .riyadh, .jeddah: return "🇸🇦"
        case .dubai, .abuDhabi: return "🇦🇪"
        case .doha: return "🇶🇦"
        case .kuwaitCity: return "🇰🇼"
        case .marrakech: return "🇲🇦"
        case .beirut: return "🇱🇧"
        case .london: return "🇬🇧"
        case .paris: return "🇫🇷"
        case .rome: return "🇮🇹"
        case .tokyo: return "🇯🇵"
        case .newYork, .losAngeles: return "🇺🇸"
        case .singapore: return "🇸🇬"
        case .sydney: return "🇦🇺"
        }
    }
}
