//
//  OrderDetailViewController.swift
//  GetirGotur
//
//  Created by Behran Kankul on 17.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

protocol OrderDetailDisplayLogic: class
{

}

class OrderDetailViewController: BaseViewController, OrderDetailDisplayLogic
{
    var interactor: OrderDetailBusinessLogic?
    var router: (NSObjectProtocol & OrderDetailRoutingLogic & OrderDetailDataPassing)?

    // MARK: Object lifecycle
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        OrderDetailWorker().doSetup(self)
    
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        OrderDetailWorker().doSetup(self)
    }
  
    // MARK: Routing
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
  
    // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension OrderDetailViewController {
    
}
