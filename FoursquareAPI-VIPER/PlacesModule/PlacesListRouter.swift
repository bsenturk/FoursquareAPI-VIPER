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

    static func createModule() -> PlacesListViewController {

        let router = PlacesListRouter()
        let presenter = PlacesListPresenter()
        let interactor = PlacesListInteractor()
        let view = PlacesListViewController(nibName: "PlacesListViewController",
                                                                bundle: nil)

        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view

        router.presenter = presenter

        interactor.presenter = presenter

        view.presenter = presenter

        return view
    }
}

extension PlacesListRouter: PlacesListRouterProtocol {
    func popBack() {

    }

    func present() {

    }


}
