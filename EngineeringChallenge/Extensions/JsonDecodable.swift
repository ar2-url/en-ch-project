//
//  JsonDecodable
//  EngineeringChallenge
//
//  Created by Artur on 02/06/21.
//

import Foundation

protocol JsonDecodable {
    func decode<T:Codable>(input:Data, type:T.Type)-> T?
}

extension JsonDecodable {
    func decode<T:Codable>(input:Data, type:T.Type)-> T? {
        return  try? JSONDecoder().decode(T.self, from: input)
    }
}
