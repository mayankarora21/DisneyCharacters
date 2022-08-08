//
//  DetailsViewController.swift
//  DisneyCharacters
//
//  Created by user224841 on 7/31/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var character: DisneyCharacter?
    
    
    var charcterObjectKeys = [String]()
    var charcterObjectValues = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = character!.name
        if let url = URL(string: character!.imageURL) {
            characterImage.setImage(url: url, placeholder: nil, cache: nil)
        }
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        charcterObjectKeys = ["Films", "Short Films", "TV Shows", "Video Games", "Park Attractions", "Allies", "Enemies"]
        charcterObjectValues = [
            (character!.films.isEmpty ? "No Films" : character!.films.joined(separator: ", ")),
            (character!.shortFilms.isEmpty ? "No Short Films" : character!.shortFilms.joined(separator: ", ")),
            (character!.tvShows.isEmpty ? "No TV Shows" : character!.tvShows.joined(separator: ", ")),
            (character!.videoGames.isEmpty ? "No Video Games" : character!.videoGames.joined(separator: ", ")),
            (character!.parkAttractions.isEmpty ? "No Park Attractions" : character!.parkAttractions.joined(separator: ", ")),
            (character!.allies.isEmpty ? "No Allies" : character!.allies.joined(separator: ", ")),
            (character!.enemies.isEmpty ? "No Enemies" : character!.enemies.joined(separator: ", "))
        ]
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        characterImage.layer.borderWidth = 1
        characterImage.layer.masksToBounds = false
        characterImage.layer.cornerRadius = characterImage.frame.height/2 //This will change with corners of image and height/2 will make this circle shape
        characterImage.clipsToBounds = true
    }

}

extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let currCellContent = "\(charcterObjectKeys[indexPath.row]):  \(charcterObjectValues[indexPath.row])"
        currCell.textLabel?.text = currCellContent
        currCell.textLabel?.numberOfLines = 0
        return currCell
    }
}
