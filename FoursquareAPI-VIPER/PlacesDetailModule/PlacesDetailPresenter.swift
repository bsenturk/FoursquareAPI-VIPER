//
//  PlacesDetailPresenter.swift
//  FoursquareAPI-VIPER
//
//  Created by Burak Şentürk on 31.12.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

import Foundation

final class PlacesDetailPresenter {
    var view: PlacesDetailViewProtocol?
    var router: PlacesDetailRouterProtocol?
    var lat: Double = 0.0
    var lng: Double = 0.0
    var name: String = ""
}

extension PlacesDetailPresenter: PlacesDetailPresenterProtocol {

    func placeInfo(name: String, lat: Double, lng: Double) {
        self.name = name
        self.lat = lat
        self.lng = lng
    }

    func notifyViewLoaded() {
        view?.getPlaceInfo(lat: lat, lng: lng)
        view?.setNavigationTitle(title: name)
    }
}
