//
//  Notifications.swift
//  gameNewsV2
//
//  Created by tobi adegoroye on 17/05/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import Foundation
import UserNotifications

class Notifications {
    
    func setNotification(){
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Hey come back and see the new reviews"
        content.body = "Come and read me"
        
        let date = Date().addingTimeInterval(20)
        let dateCompenents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second ], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateCompenents, repeats: false)
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        center.add(request) { (error) in
            if (error != nil){
                print("error")
            }
        }
    }
}
