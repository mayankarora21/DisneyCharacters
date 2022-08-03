//
//  CharacterCell.swift
//  DisneyCharacters
//
//  Created by user224841 on 7/27/22.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var characterImage: UIImageView!
    
    var character: DisneyCharacter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        characterImage.layer.borderWidth = 1
        characterImage.layer.masksToBounds = false
        characterImage.layer.cornerRadius = characterImage.frame.height/2 //This will change with corners of image and height/2 will make this circle shape
        characterImage.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadCell(){
        label.text = character?.name
        if let urlString = character?.imageURL, let url = URL(string: urlString) {
            characterImage.setImage(url: url, placeholder: nil, cache: nil)
        }
    }
    
    
}
