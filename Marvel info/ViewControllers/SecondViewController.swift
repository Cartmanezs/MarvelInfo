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
    @IBOutlet weak var heroImageView: UIImageView!
    
    var character: CharactersInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let character = self.character {
            nameLabel.text = character.name
            descriptionLabel.text = character.description
            setImage(heroImage: heroImageView, character: character)
        }
    }
    
    private func setImage(heroImage: UIImageView, character: CharactersInfo?) {
          guard let character = character else { return }
          let fullPath = (character.thumbnail?.path ?? "") + "/portrait_xlarge." + (character.thumbnail?.imageExtension ?? "jpg")
          if let imageUrl = URL(string: fullPath) {
               heroImage.sd_setImage(with: imageUrl)
           } else {
               heroImage.image = nil
           }
      }
}

