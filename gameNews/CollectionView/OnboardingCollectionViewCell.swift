//
//  OnboardingCollectionViewCell.swift
//  gameNewsV2
//
//  Created by tobi adegoroye on 02/07/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import UIKit
import Lottie
import Foundation

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var screenTitle: UILabel!
    
    @IBOutlet weak var screenDescription: UITextView!
    
    
    var animation = AnimationView()
    
    static let identifier = "OnboardingCollectionViewCell"
    
    func configureCell(page: Page){
        
        // define the animation and the size
        animation = AnimationView(name: page.animationName)
        animation.frame = CGRect(x: 0, y: 0, width: self.frame.width-40, height: self.frame.height * 0.8)
        
        // customize the animation
        animation.animationSpeed = 1
        animation.loopMode = .loop
        animation.play()
        
        animationView.addSubview(animation)
        
        // set the title and description of the screen
        self.screenTitle.text = page.title
        self.screenDescription.text = page.description
    }
    

    
}
