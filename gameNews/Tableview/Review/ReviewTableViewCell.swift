//
//  ReviewTableViewCell.swift
//  gameNews
//
//  Created by tobi adegoroye on 03/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import UIKit

protocol ReviewTableViewCellDelegate {
    func didFavourite(_ cell:ReviewItems)
}

class ReviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var reviewImg: UIImageView!
    
    @IBOutlet weak var reviewTitle: UILabel!
    
    @IBOutlet weak var starButton: UIButton!
    
    static let cellID = "ReviewTableViewCell"
    
    private var delegate: ReviewTableViewCellDelegate?
    private var review: ReviewItems?
    
    var isbookmarked = false
    
    var link: ReviewViewController?
    private var reviewItem: ReviewItems?
    
    func configure(with review: ReviewItems,delegate: ReviewTableViewCellDelegate){
        self.review = review
        self.delegate = delegate
        reviewTitle.text = review.title
        reviewImg.kf.indicatorType = .activity
        reviewImg.kf.setImage(with: URL(string: review.image.original ?? ""))
    }
    
 
    @IBAction func bookmarkBtnDidTouch(_ sender: Any) {
        if let selectedCell = review {
            delegate?.didFavourite(selectedCell)
         }

    }
 
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reviewTitle.text = nil
    }
    
}
