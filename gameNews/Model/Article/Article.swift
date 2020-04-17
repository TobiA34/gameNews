//
//  Article.swift
//  gameNews
//
//  Created by tobi adegoroye on 02/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import Foundation


struct ArticleItem: Decodable {
    let title: String
    let image: Images
     let id: Int
    let authors: String
    let deck: String
    let body: String
    
}

struct ArticleResults:Decodable {
    var results: [ArticleItem]
}

 struct Images:Decodable{
    let square_tiny: String?
    let screen_tiny: String?
    let square_small: String?
    let original: String?
}
