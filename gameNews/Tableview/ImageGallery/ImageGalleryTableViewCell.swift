//
//  ImageGalleryTableViewCell.swift
//  gameNews
//
//  Created by tobi adegoroye on 08/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import UIKit
import Kingfisher

class ImageGalleryTableViewCell: UITableViewCell {
    @IBOutlet weak var imgGalleryiv: UIImageView!
     @IBOutlet weak var titleLbl: UILabel!
    
    static let cellID = "ImageGalleryTableViewCell"

 
    
    func configure(with imgGallery: ImgGalleryItem ){
        
          titleLbl.text = imgGallery.title
         imgGalleryiv.kf.indicatorType = .activity
         imgGalleryiv.kf.setImage(with: URL(string: imgGallery.image.original ?? ""))
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
         titleLbl.text = nil
    }
 
}
