//
//  CharactersTableViewController.swift
//  Marvel info
//

//  Created by Ingvar on 01.05.2020.
//  Copyright © 2020 Igor. All rights reserved.
//

import UIKit

class CharactersTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacters()
    }
    
    var characters: [CHARACTERSINFO] = []
    
    private func getCharacters() {
        CharactersRequest.shared.genericFetch(completion: {  [unowned self](charecterResult: Result<CHARACTERSINFO,Error>) -> Void in
            charecterResult.flatMap { (character) -> Result<CHARACTERSINFO, Error> in
                return .success(character)
            }
            guard let characters =  try? charecterResult.get() else { return }
            self.characters = [characters]

            self.tableView.reloadData()
        })
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroInfoTableViewCell
        let character = characters[indexPath.row]
        cell.heroName = character.name
        
        return cell
    }
}
