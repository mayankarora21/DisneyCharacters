//
//  ViewController.swift
//  DisneyCharacters
//
//  Created by user224841 on 7/27/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedRowIndex = 0
    
    var characters = [
        Character(name: "'Olu Mel", imageURL: "https://static.wikia.nocookie.net/disney/images/6/61/Olu_main.png"),
        Character(name: ".GIFfany", imageURL: "https://static.wikia.nocookie.net/disney/images/5/51/Giffany.png"),
        Character(name: "9-Eye", imageURL: "https://static.wikia.nocookie.net/disney/images/7/77/9-eye.jpg"),
        Character(name: "90's Adventure Bear", imageURL: "https://static.wikia.nocookie.net/disney/images/3/3f/90%27s_Adventure_Bear_profile.png"),
        Character(name: "A.B.E.", imageURL: "https://static.wikia.nocookie.net/disney/images/2/20/ABE.jpg"),
        Character(name: "A.J. Arno", imageURL: "https://static.wikia.nocookie.net/disney/images/2/2c/A.J._Arno.jpg"),
        Character(name: "Abdullah", imageURL: "https://static.wikia.nocookie.net/disney/images/c/cb/1087603-44532-clp-950.jpg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellReuseIdentifier: "CharacterCell")
        tableView.dataSource = self
        tableView.delegate = self
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
        currCell.label.text = characters[indexPath.row].name
        let url = characters[indexPath.row].imageURL
//        if indexPath.row % 2 == 0 {
//            currCell.label.text = "hello world ashdkdsljaldowd.asmsalkdakdoipuoijpoksd;lasd,;l'l'las;l,x;amkd;kd;la'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
//        }
        setImage(url: url, imageView: currCell.characterImage)
//        let imageURL = URL(string: url)
//        // just not to cause a deadlock in UI!
//        DispatchQueue.global().async {
//            let imageData = try? Data(contentsOf: imageURL!)
//
//            let image = UIImage(data: imageData!)
//            DispatchQueue.main.async {
//                currCell.characterImage.image = image
//            }
//        }
        return currCell
    }
    func setImage(url: String, imageView: UIImageView) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            imageView.layer.borderWidth = 1
            imageView.layer.masksToBounds = false
            imageView.layer.cornerRadius = imageView.frame.height/2 //This will change with corners of image and height/2 will make this circle shape
            imageView.clipsToBounds = true
            DispatchQueue.main.async {
                imageView.image = image
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRowIndex = indexPath.row
        performSegue(withIdentifier: "navigateToDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navigateToDetails" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.character = characters[selectedRowIndex]
        }
    }
}
