//
//  PlacesProtocol.swift
//  FoursquareAPI-VIPER
//
//  Created by Burak Şentürk on 30.12.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

import UIKit

protocol PlacesListViewProtocol {
    func showLoading()
    func hideLoading()
    func reloadData()
}

protocol PlacesListPresenterProtocol {
    //PlacesListView -> PlacesListPresenter
    func notifyViewLoaded()
    func didSelectPlaces(at index: Int)

    //PlacesListInteractor -> PlacesListPresenter
    func placesListFetched(places: [NSObject])
    func placesListFetchFailed()
}

protocol PlacesListRouterProtocol {
    //PlacesListPresenter -> PlacesListRoter
    func popBack()
    func present()
}

protocol PlacesListInteractorProtocol {
    //Presenter -> Interactor
    func fetchPlaces()
}
