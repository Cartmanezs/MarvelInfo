//
//  CharactersTableViewController.swift
//  Marvel info
//

//  Created by Ingvar on 01.05.2020.
//  Copyright © 2020 Igor. All rights reserved.
//

import UIKit

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
    
        let character = characters[indexPath.row]
        cell.heroName = character?.name
        cell.descriptionCharacter = character?.description
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if let destination = segue.destination as? SecondViewController {
            destination.character = characters[(tableView.indexPathForSelectedRow?.row)!]
          }
      }
}
