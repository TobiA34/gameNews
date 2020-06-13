//
//  BookmarkViewController.swift
//  gameNews
//
//  Created by tobi adegoroye on 26/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import UIKit
import CoreData
import SafariServices


class BookmarkViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    private var reviewDatabaseManger: ReviewDatabaseManager?
    let bookmarkTableViewCell = BookmarkTableViewCell()
    
    
    private var taskArray: [Review] = [] {
        didSet {
            self.tableview.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 150
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: BookmarkTableViewCell.cellID, bundle: nil), forCellReuseIdentifier: BookmarkTableViewCell.cellID)
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
             self.reviewDatabaseManger = ReviewDatabaseManager(context: context)
         }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.taskArray = reviewDatabaseManger?.fetchAllData() ?? []
    }
    
}

extension BookmarkViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.taskArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let cell = tableView.dequeueReusableCell(withIdentifier:  BookmarkTableViewCell.cellID ,for: indexPath) as? BookmarkTableViewCell

        let review = self.taskArray[indexPath.row]
        
        cell?.configureBookmark(with: review)
       
        return cell!
        
         
        
    }
 
}

extension BookmarkViewController: UITableViewDelegate {
    
}

 
