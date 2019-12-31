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
        tableView.register(UINib(nibName: "PlacesListCell",
                                 bundle: nil), forCellReuseIdentifier: "PlacesListCell")
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension PlacesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return presenter?.venues().count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesListCell",
                                                 for: indexPath) as! PlacesListCell
        guard let venues = presenter?.venues() else { return UITableViewCell() }
        cell.venues = venues[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectPlaces(at: indexPath.row)
    }

}

