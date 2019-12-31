//
//  PlacesListPresenter.swift
//  FoursquareAPI-VIPER
//
//  Created by Burak Şentürk on 30.12.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

import UIKit

final class PlacesListPresenter {
    var view: PlacesListViewProtocol?
    var router: PlacesListRouterProtocol?
    var interactor: PlacesListInteractorProtocol?
    var venuesResponse: VenuesResponse?
}

extension PlacesListPresenter: PlacesListPresenterProtocol {

    func notifyViewLoaded() {
        view?.setupInitialView()
        view?.showLoading()
        interactor?.fetchPlaces()
        view?.setNavigationTitle(with: "Places")
    }

    func didSelectPlaces(at index: Int) {

    }

    func placesListFetched(places: VenuesResponse) {
        venuesResponse = places
        view?.reloadData()
    }

    func placesListFetchFailed() {
        interactor?.failed()
    }

    func venues() -> [Venues] {
        guard let venues = venuesResponse?.response.venues else { return [] }
        return venues
    }
}
