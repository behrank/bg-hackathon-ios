//
//  BaseNavigationController.swift
//  GetirGotur
//
//  Created by Behran Kankul on 17.02.2018.
//  Copyright © 2018 KG Teknoloji. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    var strViewTitle:String!
    var strViewSubTitle:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UINavigationBar.appearance().shadowImage = UIImage()
        //UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationBar.barTintColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
        self.navigationBar.isTranslucent = false

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

