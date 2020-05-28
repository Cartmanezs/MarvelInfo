//
//  CharactersTableViewController.swift
//  Marvel info
//

//  Created by Ingvar on 01.05.2020.
//  Copyright © 2020 Igor. All rights reserved.
//

import UIKit
import SDWebImage

class CharactersTableViewController: UITableViewController {

    private var dataFetcherService = DataFetcherService()
    var characters: [CharactersInfo?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataFetcherService.fetchCharacters { [weak self] (characters) in
            guard let `self` = self, let characters = characters?.data?.results else { return }
            self.characters = characters
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroInfoTableViewCell
        
         if let character = self.characters[indexPath.row] {
            cell.heroName = character.name
            cell.descriptionCharacter = character.description
            
            setImage(heroImage: cell.heroImageView, character: character)
        }
         return cell
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
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if let destination = segue.destination as? SecondViewController {
            destination.character = characters[(tableView.indexPathForSelectedRow?.row)!]
          }
      }
}
