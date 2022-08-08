//
//  NetworkingManager.swift
//  DisneyCharacters
//
//  Created by user224841 on 8/6/22.
//

import Foundation
import Alamofire

class NetworkingManager {
    
    func getDisneyCharactersData(onCompletion: @escaping ([DisneyCharacter]) -> Void){
        AF.request(disneyCharactersURL)
            .validate()
            .responseDecodable(of: DisneyCharactersResponse.self) { (response) in
                print("response is \(response)")
                guard let disneyCharactersResponse = response.value else { return }
                onCompletion(disneyCharactersResponse.disneyCharacters)
            }
        
        //        let request = AF.request(disneyCharactersURL)
        //        request.responseJSON { (data) in
        //            print(data)
        //        }
    }
}
