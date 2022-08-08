//
//  DisneyCharacterViewModel.swift
//  DisneyCharacters
//
//  Created by user224841 on 8/6/22.
//

import Foundation


class DisneyCharactersViewModel {
    var characters = [DisneyCharacter]()
    private let networkingManager = NetworkingManager()
    var reloadTable: (() -> ())?
    
    func getDisneyCharactersData(){
        networkingManager.getDisneyCharactersData() {
            (disneyCharactersList) in
            self.characters = disneyCharactersList
            self.reloadTable?()
        }
    }
}
