//
//  SettingsViewController.swift
//  gameNews
//
//  Created by tobi adegoroye on 14/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func gameSpotLink(_ sender: Any) {
        
     guard let url = URL(string: "https://www.gamespot.com/") else { return }
     UIApplication.shared.open(url)
    }
    
 

}
