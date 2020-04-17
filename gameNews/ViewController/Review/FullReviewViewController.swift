//
//  FullReviewViewController.swift
//  gameNews
//
//  Created by tobi adegoroye on 13/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import UIKit

class FullReviewViewController: UIViewController {
    @IBOutlet weak var reviewImg: UIImageView!
    
    @IBOutlet weak var reviewTitleLbl: UILabel!
    
    @IBOutlet weak var reviewParagraphLbl: UILabel!
    
    @IBOutlet weak var ratingsLbl: UILabel!
    
    var review: ReviewItems?
    

    func FullReview() {
        reviewTitleLbl.text = review?.title
        reviewParagraphLbl.text = review?.deck
         reviewImg.kf.indicatorType = .activity
        reviewImg.kf.setImage(with: URL(string: review?.image.original ?? ""))
        ratingsLbl.text =  review?.score
        
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FullReview()

        // Do any additional setup after loading the view.
    }
    

 

}
