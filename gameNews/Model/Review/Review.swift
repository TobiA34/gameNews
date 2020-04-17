//
//  Review.swift
//  gameNews
//
//  Created by tobi adegoroye on 03/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import Foundation

struct ReviewItems: Decodable {
    
     let title: String
     let image: ReviewImage
    let score: String
    let deck: String
}


struct ReviewResults:Decodable {
    var results: [ReviewItems]
}

 struct ReviewImage:Decodable{
    let square_tiny: String?
    let screen_tiny: String?
    let square_small: String?
    let original: String?
}

