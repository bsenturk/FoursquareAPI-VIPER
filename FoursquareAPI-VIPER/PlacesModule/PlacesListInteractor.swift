//
//  PlacesListInteractor.swift
//  FoursquareAPI-VIPER
//
//  Created by Burak Şentürk on 30.12.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

import UIKit

final class PlacesListInteractor {
    var presenter: PlacesListPresenterProtocol?
}

extension PlacesListInteractor: PlacesListInteractorProtocol {

    func fetchPlaces() {
        let urlParameters: [String: String] = ["near": "Istanbul",
                                               "client_id": Constant.ClientKeys.clientId,
                                               "client_secret": Constant.ClientKeys.clientSecret,
                                               "v": "20193112"]
        Network.shared.request(path: Endpoints.search,
                               method: .get,
                               bodyParameters: nil,
                               urlParameters: urlParameters,
                               succeed: succeed,
                               failed: failed)
    }

    func succeed(_ response: VenuesResponse) {
        presenter?.placesListFetched(places: response)
    }

    func failed() {
        print("Failed..")
    }
}
