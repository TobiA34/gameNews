//
//  ReviewViewController.swift
//  gameNews
//
//  Created by tobi adegoroye on 03/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import UIKit
import CoreData
 
let appDelegate = UIApplication.shared.delegate as? AppDelegate


class ReviewViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
 
    
    private let reviewRequest = ReviewRequest()
    private let reviewTableViewCell =  ReviewTableViewCell()
    private var reviewDatabaseManager: ReviewDatabaseManager?
 
    var review: Review?

    private var datasource: Array<ReviewItem> = [] {
        didSet{
            tableview.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            self.reviewDatabaseManager = ReviewDatabaseManager(context: context)
        }
        updateTableView()
        
        
        
        
     }
 
    
    
    
    func updateTableView(){
        getAllImgGallery()
        setupTableView()
    }
    
    
    func setupTableView(){
        tableview.tableFooterView = UIView()
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 128
        tableview.register(UINib(nibName: "ReviewTableViewCell" ,bundle: nil), forCellReuseIdentifier: ReviewTableViewCell.cellID)
    }
    
    func getAllImgGallery(){
        
        reviewRequest.getReview { res in
            switch res{
            case.success(let review):
                self.datasource = review
            case.failure(let error):
                print("Failed to show review:",error)
                
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "fullReview") {
            let vc = segue.destination as! FullReviewViewController
            vc.review = sender as? ReviewItem
            // pass data to next view
        }
    }
    
    
    
}



extension ReviewViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let review = datasource[indexPath.row]
        performSegue(withIdentifier: "fullReview", sender: review)
        
    }
}

extension ReviewViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let review = datasource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.cellID, for: indexPath) as? ReviewTableViewCell
        cell?.configure(with: review, isBookmarked: reviewDatabaseManager?.doesExist(reviewItem: review) ?? false, delegate: self)
        return cell!
    }
    
    
}

extension ReviewViewController: ReviewTableViewCellDelegate{
    func didFavourite(_ item: ReviewItem) {
        
        reviewDatabaseManager?.save(item: item)
        tableview.reloadData()
        
      }
}
