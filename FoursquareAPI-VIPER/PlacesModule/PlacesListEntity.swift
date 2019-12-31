//
//  PlacesListEntity.swift
//  FoursquareAPI-VIPER
//
//  Created by Burak Şentürk on 30.12.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

import Foundation

final class VenuesResponse: Decodable {
    let response: VenuesList
}

final class VenuesList: Decodable {
    let venues: [Venues]

    func count() -> Int {
        return venues.count
    }
}

final class Venues: Decodable {
    let id: String
    let name: String
    let location: Location
    let categories: [Categories]
    let referralId: String
    let hasPerk: Bool
}

final class Categories: Decodable {
    let id: String
    let name: String
}

final class Location: Decodable {
    let lat: Double
    let lng: Double
    let city: String?
    let state: String?

    var address: String? {
        get {
            return "\(city ?? "") \(state ?? "")"
        }
     }
}
