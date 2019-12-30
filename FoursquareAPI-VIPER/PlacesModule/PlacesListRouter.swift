//
//  PlacesListRouter.swift
//  FoursquareAPI-VIPER
//
//  Created by Burak Şentürk on 30.12.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

import UIKit

final class PlacesListRouter {
    static func createModule(using navigationController: UINavigationController) -> PlacesListViewController {

        let router = PlacesListRouter()
        let presenter = PlacesListPresenter()
        let interactor = PlacesListInteractor()
        let placesListViewController = PlacesListViewController(nibName: "PlacesListViewController",
                                                                bundle: nil)

        

        return placesListViewController
    }
}
