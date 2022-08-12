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
    var filteredCharacters = [DisneyCharacter]()
    
    func getDisneyCharactersData(){
        networkingManager.getDisneyCharactersData() {
            (disneyCharactersList) in
            self.characters = disneyCharactersList
            self.filteredCharacters = disneyCharactersList
            self.reloadTable?()
        }
    }
    
    func filterCharacters(searchString: String){
        if searchString.isEmpty {
            filteredCharacters = characters
        }
        else{
            filteredCharacters = characters.filter({ $0.name.lowercased().contains(searchString) })
        }
        reloadTable?()
    }
}
