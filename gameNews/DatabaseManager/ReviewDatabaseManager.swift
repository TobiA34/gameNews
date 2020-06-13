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


class ReviewDatabaseManager {
    
    private var context: NSManagedObjectContext!
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func save(item: ReviewItem){
        // check to see if an item exist then delete item else save item in coreData on the background thread.
        if doesExist(reviewItem: item) {
            delete(item: item)
        }
        else {
            context.perform {
                let review = Review(context: self.context)
                
                review.title = item.title
                 review.image = item.image.original
                
                do {
                    try self.context.save()
                    print("Data saved")
                } catch  {
                    print("did not save", error.localizedDescription)
                }
            }
           
        }
    }
    
    
    func getItem(with title: String) -> [Review] {
         //perform a query to get an item by its name
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Review")
        fetchRequest.predicate = NSPredicate(format: "title == %@", title)
        return try! (context.fetch(fetchRequest) as? [Review] ?? [])
    }
    
    func doesExist(reviewItem: ReviewItem) -> Bool {
        // This function checks to see if the item exist in the database
        return getItem(with: reviewItem.title).isEmpty == false
    }
    
    func delete(item: ReviewItem) {
        //When the user clicks to unbookmark the cell delete everything.
        let results = self.getItem(with: item.title)
            
            for item in results {
                
                do {
                    self.context.delete(item)
                    try self.context.save()
                    print("Data deleted")
                } catch  {
                    print("did not delete", error.localizedDescription)
                }
            }
    }
    
    func fetchAllData() -> [Review] {
        // get everything in the entity named Review
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Review")
        return try! context.fetch(fetchRequest) as? [Review] ?? []
    }
}





