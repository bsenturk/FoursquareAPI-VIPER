//
//  PlacesDetailProtocol.swift
//  FoursquareAPI-VIPER
//
//  Created by Burak Şentürk on 31.12.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

import Foundation

protocol PlacesDetailViewProtocol {
    func getPlaceInfo(lat: Double, lng: Double)
    func setNavigationTitle(title: String)
}

protocol PlacesDetailPresenterProtocol: class {
    func placeInfo(name: String, lat: Double, lng: Double)
    func notifyViewLoaded()
}

protocol PlacesDetailInteractorProtocol {

}

protocol PlacesDetailRouterProtocol {
    
}
