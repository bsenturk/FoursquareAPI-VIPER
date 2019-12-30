//
//  PlacesListPresenter.swift
//  FoursquareAPI-VIPER
//
//  Created by Burak Şentürk on 30.12.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

import UIKit

final class PlacesListPresenter {
    weak var view: PlacesListViewProtocol?
    weak var router: PlacesListRouterProtocol?
    weak var interactor: PlacesListInteractorProtocol?
    var placesList: [NSObject]?
}

extension PlacesListPresenter: PlacesListPresenterProtocol {

    func notifyViewLoaded() {
        view?.setupInitialView()
        view?.showLoading()
        interactor?.fetchPlaces()
    }

    func placesCount() -> Int {
        return placesList?.count ?? 0
    }

    func didSelectPlaces(at index: Int) {

    }

    func placesListFetched(places: [NSObject]) {
        placesList = places
    }

    func placesListFetchFailed() {

    }
}
