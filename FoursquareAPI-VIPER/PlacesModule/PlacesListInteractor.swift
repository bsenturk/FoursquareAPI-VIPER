//
//  PlacesListInteractor.swift
//  FoursquareAPI-VIPER
//
//  Created by Burak Şentürk on 30.12.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

import UIKit

final class PlacesListInteractor {
    weak var presenter: PlacesListPresenterProtocol?
}

extension PlacesListInteractor: PlacesListInteractorProtocol {

    func fetchPlaces() {
        Network.shared.request()
    }
}
