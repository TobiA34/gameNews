//
//  ReviewTableViewCell.swift
//  gameNews
//
//  Created by tobi adegoroye on 03/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import UIKit

protocol ReviewTableViewCellDelegate {
    func didFavourite(_ item: ReviewItem)
}

class ReviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var reviewImg: UIImageView!
    
    @IBOutlet weak var reviewTitle: UILabel!
    
    @IBOutlet weak var starButton: UIButton!
    
    static let cellID = "ReviewTableViewCell"
    
    private var delegate: ReviewTableViewCellDelegate?
    private var review: ReviewItem?
    
    var isbookmarked = false
    
    var link: ReviewViewController?
    private var reviewItem: ReviewItem?
    
    func configure(with review: ReviewItem, isBookmarked: Bool, delegate: ReviewTableViewCellDelegate){
        self.review = review
        self.delegate = delegate
        reviewTitle.text = review.title
        reviewImg.kf.indicatorType = .activity
        reviewImg.kf.setImage(with: URL(string: review.image.original ?? ""))
        starButton.setImage(isBookmarked ? #imageLiteral(resourceName: "bookmark-on") : #imageLiteral(resourceName: "bookmark-off"), for: .normal)
    }
    
 
    
    @IBAction func bookmarkBtnDidTouch(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
            self.starButton.transform = .init(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
                self.starButton.transform = .identity
            })
        }
        
        if let selectedCell = review {
            delegate?.didFavourite(selectedCell)
         }

    }
 
 
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reviewTitle.text = nil
        reviewImg.image = nil
        starButton.setImage(nil, for: .normal)
    }
    
}
