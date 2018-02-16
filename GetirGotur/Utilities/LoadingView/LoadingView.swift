//
//  LoadingView.swift
//  Near
//
//  Created by Behran Kankul on 3.02.2018.
//  Copyright © 2018 Be Mobile. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import PureLayout

class LoadingView:UIView {
    
    @IBOutlet weak var loader: NVActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var isOnFire : Bool = false {
        willSet {
            if newValue == isOnFire { return }
            if newValue {
                guard let window = UIApplication.shared.keyWindow else { return }
                window.addSubview(self)
                window.bringSubview(toFront: self)
                autoPinEdgesToSuperviewEdges()
                loader.startAnimating()
            } else {
                loader.stopAnimating()
                removeFromSuperview()
            }
        }
    }
}
