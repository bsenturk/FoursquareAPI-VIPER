//
//  PlacesListRouter.swift
//  FoursquareAPI-VIPER
//
//  Created by Burak Şentürk on 30.12.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

import UIKit

final class PlacesListRouter {
    weak var presenter: PlacesListPresenterProtocol?
    weak var navigationController: UINavigationController?

    static func createModule(using navigationController: UINavigationController) -> PlacesListViewController {

        let router = PlacesListRouter()
        let presenter = PlacesListPresenter()
        let interactor = PlacesListInteractor()
        let view = PlacesListViewController(nibName: "PlacesListViewController",
                                                                bundle: nil)

        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view

        router.presenter = presenter
        router.navigationController = navigationController


        interactor.presenter = presenter

        view.presenter = presenter

        return view
    }
}

extension PlacesListRouter: PlacesListRouterProtocol {
    func popBack() {

    }

    func push(name: String, lat: Double, lng: Double) {
        let placesDetailModule = PlacesDetailRouter.createModule(name: name,
                                                                 lat: lat,
                                                                 lng: lng)
        navigationController?.pushViewController(placesDetailModule,
                                                 animated: true)
    
    }


}
