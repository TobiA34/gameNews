//
//  ViewController.swift
//  gameNews
//
//  Created by tobi adegoroye on 02/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import UIKit


class ArticleViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    
    let myIndicator = UIActivityIndicatorView(style: .white)

 
    let articleTableviewCell = ArticleTableViewCell()
     private let notifications = Notifications()
    private let apiRequest = ApiRequest()
    
    private var datasource: Array<ArticleItem> = [] {
        didSet{
            tableview.reloadData()
            
        }
    }
    
    override func viewDidLoad() {
//        loadIndicator()
 
         super.viewDidLoad()
        
        updateTableView()
        notifications.setNotification()
        
  
    }
     
    
    func loadIndicator(){
        myIndicator.center = self.view.center
        self.view.addSubview(myIndicator)
        myIndicator.bringSubviewToFront(self.view)
        myIndicator.startAnimating()
    }
    
    func stopIndicator(){
        myIndicator.stopAnimating()
    }
    
    func updateTableView(){
        getAllArticles()
        setupTableView()
    }
    
    
    
    func setupTableView(){
        tableview.tableFooterView = UIView()
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 128
        tableview.register(UINib(nibName: "ArticleTableViewCell" ,bundle: nil), forCellReuseIdentifier: ArticleTableViewCell.cellID)
        
    }
    
    func getAllArticles(){
        self.loadIndicator()
        apiRequest.getArticle { res in
            
            switch res {
            case.success(let article):
                self.datasource = article
            case.failure(let error):
                print("Failed to show article:",error)
                
            }
            self.stopIndicator()
        }
    }
    
 
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "fullArticle") {
            let vc = segue.destination as! FullArticleViewController
            vc.article = sender as? ArticleItem
            // pass data to next view
        }
    }
}


extension ArticleViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = datasource[indexPath.row]
        performSegue(withIdentifier: "fullArticle", sender: article)
        
    }
}

extension ArticleViewController: UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let article = datasource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.cellID, for: indexPath) as? ArticleTableViewCell
        cell?.configure(with: article)

        return cell!
    }
    
    
    
    
}

 







