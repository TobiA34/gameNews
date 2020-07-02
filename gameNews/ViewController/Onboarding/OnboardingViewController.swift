//
//  OnboardingViewController.swift
//  gameNewsV2
//
//  Created by tobi adegoroye on 02/07/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import UIKit
import Foundation


class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var getStartedButton: UIButton!
    
    
    let pages: [Page] = [Page(animationName: "newspaper-spinner", title: "Article", description: "See latest game news article"),
                         Page(animationName: "review-animation", title: "Review", description: "See brand new game reviews"),
                         Page(animationName: "photo-gallery", title: "Image-Gallery", description: "See the latest game image gallery")]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.getStartedButton.layer.cornerRadius = 20
        
        // register the custom CollectionViewCell and assign the delegates to the ViewController
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: OnboardingCollectionViewCell.identifier, bundle: Bundle.main),forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
        self.pageControl.numberOfPages = self.pages.count

    }
    
    @IBAction func pageChanged(_ sender: Any) {
        
            let pc = sender as! UIPageControl
            
            // scrolling the collectionView to the selected page
            collectionView.scrollToItem(at: IndexPath(item: pc.currentPage, section: 0),
                                        at: .centeredHorizontally, animated: true)
        }
    
    
    @IBAction func getStartedButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(identifier: "mainvc")
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC,animated: true,completion: nil)
        
    }
    
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier,
                                                      for: indexPath) as! OnboardingCollectionViewCell
        // function for configuring the cell, defined in the Custom cell class
        cell.configureCell(page: pages[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    // to update the UIPageControl
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}
