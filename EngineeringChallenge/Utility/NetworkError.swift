//
//  NetworkError
//  EngineeringChallenge
//
//  Created by Artur on 02/06/21.
//
import Foundation

enum NetworkError: Error {
    case parsinFailed(message:String)
    case errorWith(message:String)
    case networkNotAvailalbe
    case malformedURL(message:String)
}
