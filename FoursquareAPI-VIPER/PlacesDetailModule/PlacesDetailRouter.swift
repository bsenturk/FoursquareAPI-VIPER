//
//  PlacesDetailRouter.swift
//  FoursquareAPI-VIPER
//
//  Created by Burak Şentürk on 31.12.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

import Foundation

final class PlacesDetailRouter {

    weak var presenter: PlacesDetailPresenterProtocol?

    static func createModule(name: String, lat: Double, lng: Double) -> PlacesDetailViewController {

        let view = PlacesDetailViewController(nibName: "PlacesDetailViewController",
                                              bundle: nil)
        let router = PlacesDetailRouter()
        let presenter = PlacesDetailPresenter()

        view.presenter = presenter
        router.presenter = presenter
        presenter.view = view

        router.presenter?.placeInfo(name: name, lat: lat, lng: lng)
        return view
    }
}
