//
//  ArticleTableViewCell.swift
//  gameNews
//
//  Created by tobi adegoroye on 02/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import UIKit
import Kingfisher
 
class ArticleTableViewCell: UITableViewCell {
    
    private var article: ArticleItem?
 
    static let cellID = "ArticleTableViewCell"

    @IBOutlet weak var articleImageView: UIImageView!
    
    @IBOutlet weak var articleTitleLbl: UILabel!
    
    
    func configure(with article: ArticleItem){
        self.article = article
          articleTitleLbl.text = article.title
        articleImageView.kf.indicatorType = .activity
        articleImageView.kf.setImage(with: URL(string: article.image.original ?? ""))
    }
    
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
         articleTitleLbl.text = nil
    }
    
 
    
}
