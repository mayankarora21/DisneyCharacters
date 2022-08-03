//
//  DisneyCharactersResponse.swift
//  DisneyCharacters
//
//  Created by user224841 on 8/2/22.
//

import Foundation

struct DisneyCharactersResponse: Codable {
    let disneyCharacters: [DisneyCharacter]
    let count, totalPages: Int
    let nextPage: String
    
    enum CodingKeys: String, CodingKey {
        case count, totalPages
        case nextPage
        case disneyCharacters = "data"
    }
}
