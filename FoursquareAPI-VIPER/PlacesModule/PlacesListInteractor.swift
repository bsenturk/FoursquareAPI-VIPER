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
        let urlParameters: [String: String] = ["near": "Besiktas",
                                               "client_id": Constant.ClientKeys.clientId,
                                               "client_secret": Constant.ClientKeys.clientSecret,
                                               "v": getDate()]
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

    func getDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
