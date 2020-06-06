//
//  ReviewRequest.swift
//  gameNews
//
//  Created by tobi adegoroye on 09/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import Foundation
import Alamofire

class ReviewRequest{
    func getReview(completion: @escaping (Swift.Result<Array<ReviewItem>, Error>) -> ()) {
    Alamofire.request("http://www.gamespot.com/api/reviews/?api_key=1f4d669acd0602575bbe10c894a2b0ae91215a27&format=json").response { response in
            do {
                guard let data = response.data else { return }
                
                let decoder =  JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                 let reviewResult = try decoder.decode(ReviewResults.self, from: data)
                
                completion(.success(reviewResult.results ?? []))
                
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }
    }
}
