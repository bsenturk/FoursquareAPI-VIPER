//
//  PlacesProtocol.swift
//  FoursquareAPI-VIPER
//
//  Created by Burak Şentürk on 30.12.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

import UIKit

protocol PlacesListViewProtocol: class {
    func showLoading()
    func hideLoading()
    func reloadData()
    func setupInitialView()
    func setNavigationTitle(with title: String)
}

protocol PlacesListPresenterProtocol: class {
    //PlacesListView -> PlacesListPresenter
    func notifyViewLoaded()
    func placesCount() -> Int
    func didSelectPlaces(at index: Int)

    //PlacesListInteractor -> PlacesListPresenter
    func placesListFetched(places: [NSObject])
    func placesListFetchFailed()
}

protocol PlacesListRouterProtocol: class {
    //PlacesListPresenter -> PlacesListRoter
    func popBack()
    func present()
}

protocol PlacesListInteractorProtocol: class {
    //Presenter -> Interactor
    func fetchPlaces()
}
