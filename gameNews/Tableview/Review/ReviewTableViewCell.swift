//
//  ReviewTableViewCell.swift
//  gameNews
//
//  Created by tobi adegoroye on 03/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewImg: UIImageView!
    
    @IBOutlet weak var reviewTitle: UILabel!
    
   static let cellID = "ReviewTableViewCell"

 

 
    func configure(with review: ReviewItems){
        
        reviewTitle.text = review.title
        reviewImg.kf.indicatorType = .activity
          reviewImg.kf.setImage(with: URL(string: review.image.original ?? ""))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
         reviewTitle.text = nil
    }
    
}
