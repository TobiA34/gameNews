//
//  reviewDatabaseManager.swift
//  gameNews
//
//  Created by tobi adegoroye on 26/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct key {
     static let review = "Review"
 }
 

class ReviewDatabaseManager: NSObject{
    
    private var bookmarkedReviews:[ReviewItems] = []

    var reviewItem : ReviewItems?
    
    func getbookmarkedReviews() -> Int{
        bookmarkedReviews.count
    }

    func getbookmarkIndexpath(indexPath: IndexPath){
        let bookmark = bookmarkedReviews[indexPath.row]
    }
    
    func saveData(_ cell:ReviewItems){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let managedObjectContext = appDelegate.persistentContainer.viewContext

        let reviewEntity = NSEntityDescription.entity(forEntityName: key.review, in: managedObjectContext)!
        
        let review = NSManagedObject(entity: reviewEntity, insertInto: managedObjectContext)
        
        review.setValue(reviewItem?.title, forKey: "title")
        review.setValue(reviewItem?.image, forKey: "image")
        
        do {
            try managedObjectContext.save()
             
        } catch let error as NSError {
            print("Could not fetch any.\(error), \(error.userInfo) ")
        }
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "Review", in: context)
//        let newEntity = NSManagedObject(entity: entity!, insertInto: context)
//
//
//        newEntity.setValue(reviewItem?.title, forKey: "title")
//        newEntity.setValue(reviewItem?.image, forKey: "image")
//
//
//        do {
//            try context.save()
//            print("cell has been bookmarked")
//        } catch {
//            print("failed saving")
//        }
     }
    
 
    
    func getData(){
 
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: key.review)
        do {
            bookmarkedReviews = try managedObjectContext.fetch(fetchRequest) as! [ReviewItems]
         } catch let error as NSError {
            print("Could not fetch any.\(error), \(error.userInfo) ")
        }
     }
    
}
