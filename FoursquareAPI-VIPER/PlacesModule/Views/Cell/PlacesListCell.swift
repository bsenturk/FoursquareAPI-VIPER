//
//  PlacesListCell.swift
//  FoursquareAPI-VIPER
//
//  Created by Burak Şentürk on 31.12.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

import UIKit

class PlacesListCell: UITableViewCell {

    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var lblLocation: UILabel!

    var venues: Venues? {
        didSet {
            configureCell()
        }
    }

    private func configureCell() {
        lblName.text = venues?.name
        lblLocation.text = venues?.location.address
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
