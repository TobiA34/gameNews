//
//  BookmarkViewController.swift
//  gameNews
//
//  Created by tobi adegoroye on 26/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import UIKit

class BookmarkViewController: UIViewController {
    
    let reviewDatabaseManger = ReviewDatabaseManager()
    
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
    }
    

}

extension BookmarkViewController: UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return reviewDatabaseManger.getbookmarkedReviews()
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
    let cell = tableView.dequeueReusableCell(withIdentifier: BookmarkTableViewCell.cellID, for: indexPath) as? BookmarkTableViewCell
 
    cell?.configure(with: bookmark)
 
    return cell!
}
}
