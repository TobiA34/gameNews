//
//  ImgGallery.swift
//  gameNews
//
//  Created by tobi adegoroye on 08/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import Foundation

struct ImgGalleryItem: Decodable {
//    let publish_date: Int
    let image: Image
    let title: String
    let deck: String
    
    
}

struct ImgGalleryResults:Decodable {
    var results: [ImgGalleryItem]
}

 struct Image:Decodable{
    let square_tiny: String?
    let screen_tiny: String?
    let square_small: String?
    let original: String?
}
