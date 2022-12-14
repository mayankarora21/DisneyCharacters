//
//  Character.swift
//  DisneyCharacters
//
//  Created by user224841 on 7/27/22.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let disneyCharacter = try? newJSONDecoder().decode(DisneyCharacter.self, from: jsonData)

import Foundation

struct DisneyCharacter: Codable {
    let films, shortFilms, tvShows, videoGames: [String]
    let parkAttractions: [String]
    let allies, enemies: [String]
    let id: Int
    let name: String
    let imageURL: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case films, shortFilms, tvShows, videoGames, parkAttractions, allies, enemies
        case id = "_id"
        case name
        case imageURL = "imageUrl"
        case url
    }
    
//    func toDic() -> [String:Any] {
//        var dict = [String:Any]()
//        let otherSelf = Mirror(reflecting: self)
//        for child in otherSelf.children {
//            if let key = child.label {
//                dict[key] = child.value
//            }
//        }
//        return dict
//    }
}
