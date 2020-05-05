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
    
    var heroName: String? {
        set {
            heroNameLabel.text = newValue
        }
        get {
            return heroNameLabel.text
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
