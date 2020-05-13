//
//  HeroInfoTableViewCell.swift
//  Marvel info
//
//  Created by Ingvar on 01.05.2020.
//  Copyright © 2020 Igor. All rights reserved.
//

import UIKit

class HeroInfoTableViewCell: UITableViewCell {

    @IBOutlet private weak var heroNameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var heroImageView: UIImageView!
    
    var heroName: String? {
        set {
            heroNameLabel.text = newValue
        }
        get {
            return heroNameLabel.text
        }
    }
    
    var descriptionCharacter: String? {
        set {
            descriptionLabel.text = newValue
        }
        get {
            return descriptionLabel.text
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
