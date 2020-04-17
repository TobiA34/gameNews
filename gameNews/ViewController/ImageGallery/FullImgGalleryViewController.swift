//
//  FullImgGalleryViewController.swift
//  gameNews
//
//  Created by tobi adegoroye on 14/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import UIKit

class FullImgGalleryViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var paragraphLbl: UILabel!
    @IBOutlet weak var imgGallery: UIImageView!
    
    var imageGallerys : ImgGalleryItem?
    
    func configureImgGallery(){
        titleLbl.text = imageGallerys?.title
        paragraphLbl.text = imageGallerys?.deck
        imgGallery.kf.indicatorType = .activity
              imgGallery.kf.setImage(with: URL(string: imageGallerys?.image.original ?? ""))
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        configureImgGallery()
        
        // Do any additional setup after loading the view.
    }
    

}
