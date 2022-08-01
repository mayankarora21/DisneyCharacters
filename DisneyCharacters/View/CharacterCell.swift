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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
