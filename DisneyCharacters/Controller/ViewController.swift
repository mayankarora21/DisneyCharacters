//
//  ViewController.swift
//  DisneyCharacters
//
//  Created by user224841 on 7/27/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedRowIndex = 0
    
//    var characters = [
//        Character(name: "'Olu Mel", imageURL: "https://static.wikia.nocookie.net/disney/images/6/61/Olu_main.png"),
//        Character(name: ".GIFfany", imageURL: "https://static.wikia.nocookie.net/disney/images/5/51/Giffany.png"),
//        Character(name: "9-Eye", imageURL: "https://static.wikia.nocookie.net/disney/images/7/77/9-eye.jpg"),
//        Character(name: "90's Adventure Bear", imageURL: "https://static.wikia.nocookie.net/disney/images/3/3f/90%27s_Adventure_Bear_profile.png"),
//        Character(name: "A.B.E.", imageURL: "https://static.wikia.nocookie.net/disney/images/2/20/ABE.jpg"),
//        Character(name: "A.J. Arno", imageURL: "https://static.wikia.nocookie.net/disney/images/2/2c/A.J._Arno.jpg"),
//        Character(name: "Abdullah", imageURL: "https://static.wikia.nocookie.net/disney/images/c/cb/1087603-44532-clp-950.jpg")
//    ]
    
    var characters = [DisneyCharacter]()
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellReuseIdentifier: "CharacterCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        AF.request(disneyCharactersURL)
          .validate()
          .responseDecodable(of: DisneyCharactersResponse.self) { (response) in
            print("response is \(response)")
            guard let disneyCharactersResponse = response.value else { return }
              self.characters = disneyCharactersResponse.disneyCharacters
              self.tableView.reloadData()
          }
        
//        let request = AF.request(disneyCharactersURL)
//        request.responseJSON { (data) in
//            print(data)
//        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        return 100.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currCell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        currCell.character = characters[indexPath.row]
        currCell.loadCell()
        
//        if indexPath.row % 2 == 0 {
//            currCell.label.text = "hello world ashdkdsljaldowd.asmsalkdakdoipuoijpoksd;lasd,;l'l'las;l,x;amkd;kd;la'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
//        }
        return currCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRowIndex = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "navigateToDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navigateToDetails" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.character = characters[selectedRowIndex]
        }
    }
}
