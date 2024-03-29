//
//  Review.swift
//  gameNews
//
//  Created by tobi adegoroye on 03/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import Foundation

struct ReviewItem: Decodable {
    
    var title: String
     let image: ReviewImage
    let score: String
    let deck: String
    let game: Game
}

struct Game: Decodable {
    let site_detail_url: String?
}


struct ReviewResults:Decodable {
    var results: [ReviewItem]

}

 struct ReviewImage:Decodable{
    let square_tiny: String?
    let screen_tiny: String?
    let square_small: String?
    let original: String?
}

