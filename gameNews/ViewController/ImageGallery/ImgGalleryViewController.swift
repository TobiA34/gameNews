//
//  ImgGalleryViewController.swift
//  gameNews
//
//  Created by tobi adegoroye on 08/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import UIKit

class ImgGalleryViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    private let imgGalleryRequest = ImgGalleryRequest()
    
    let myIndicator = UIActivityIndicatorView(style: .white)

    private var datasource: Array<ImgGalleryItem> = [] {
         didSet{
             tableview.reloadData()
         }
     }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateTableView()
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
           getAllImgGallery()
           setupTableView()
        }
       
    
       
       func setupTableView(){
           tableview.tableFooterView = UIView()
                tableview.rowHeight = UITableView.automaticDimension
                tableview.estimatedRowHeight = 128
                tableview.register(UINib(nibName: "ImageGalleryTableViewCell" ,bundle: nil), forCellReuseIdentifier: ImageGalleryTableViewCell.cellID)
       }

           func getAllImgGallery(){
            self.loadIndicator()
             imgGalleryRequest.getImgGallery { res in
               switch res{
               case.success(let imgGallery):
                   self.datasource = imgGallery
               case.failure(let error):
                   print("Failed to show img gallery:",error)
                   
               }
                self.stopIndicator()
            }
       }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "fullImgGallery") {
            let vc = segue.destination as! FullImgGalleryViewController
            vc.imageGallerys = sender as? ImgGalleryItem
            // pass data to next view
        }
    }

}

extension ImgGalleryViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let imgGallery = datasource[indexPath.row]
      performSegue(withIdentifier: "fullImgGallery", sender: imgGallery)

     }
}


extension ImgGalleryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imgGallery = datasource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageGalleryTableViewCell.cellID, for: indexPath) as? ImageGalleryTableViewCell
        cell?.configure(with: imgGallery)
        return cell!
    }
    
    
}
