//
//  ApiRequest.swift
//  gameNews
//
//  Created by tobi adegoroye on 02/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import Foundation
import Alamofire

class ApiRequest{
    func getArticle(completion: @escaping (Swift.Result<Array<ArticleItem>, Error>) -> ()) {
    Alamofire.request("http://www.gamespot.com/api/articles/?api_key=1f4d669acd0602575bbe10c894a2b0ae91215a27&format=json").response { response in
            do {
                guard let data = response.data else { return }
                
                let decoder =  JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                 let gamereviewResult = try decoder.decode(ArticleResults.self, from: data)
                
                completion(.success(gamereviewResult.results ?? []))
                
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }
    }
}
