//
//  TSTitleView.swift
//  TurkcellSaha
//
//  Created by Serkut Yegin on 6.11.2017.
//  Copyright © 2017 KG Teknoloji. All rights reserved.
//

import UIKit

class TSTitleView: UIView {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    func setup(_ title:String, subtitle: String) {
        lblTitle.text = title
        lblSubtitle.text = subtitle
    }
    
}
