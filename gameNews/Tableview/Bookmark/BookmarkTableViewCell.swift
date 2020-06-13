//
//  BookmarkTableViewCell.swift
//  gameNews
//
//  Created by tobi adegoroye on 26/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import UIKit
import Kingfisher

 

class BookmarkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fullArticle: UIButton!
    
    @IBOutlet weak var bookmarkTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static let cellID = "BookmarkTableViewCell"
    
 
    private var review: Review?

    
    func configureBookmark(with bookmark: Review){
        bookmarkTitle.text = bookmark.title

//        bookmarkImage.kf.indicatorType = .activity
//        bookmarkImage.kf.setImage(with: URL(string: bookmark.image  ?? ""))
    }
    
    
    @IBAction func fullArticleBtn(_ sender: Any) {
        
    
    }
    
    
}






