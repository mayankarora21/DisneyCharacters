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
    
    var character = Character(name: "", imageURL: "")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = character.name
        setImage(url: character.imageURL, imageView: characterImage)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
