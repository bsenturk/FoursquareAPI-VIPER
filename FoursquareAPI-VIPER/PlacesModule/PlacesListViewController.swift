//
//  PlacesListViewController.swift
//  FoursquareAPI-VIPER
//
//  Created by Burak Şentürk on 30.12.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

import UIKit

final class PlacesListViewController: UIViewController {

    var presenter: PlacesListPresenterProtocol?

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter?.notifyViewLoaded()
        
    }
}

extension PlacesListViewController: PlacesListViewProtocol {

    func showLoading() {

    }

    func hideLoading() {

    }

    func reloadData() {
        tableView.reloadData()
    }

    func setNavigationTitle(with title: String) {
        navigationItem.title = title
    }

    func setupInitialView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension PlacesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectPlaces(at: indexPath.row)
    }

}

