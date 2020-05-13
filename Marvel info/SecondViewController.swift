//
//  SecondViewController.swift
//  Marvel info
//
//  Created by Ingvar on 12.05.2020.
//  Copyright © 2020 Igor. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var character: CharactersInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let character = self.character {
            nameLabel.text = character.name
            descriptionLabel.text = character.description
        }
    }
}
