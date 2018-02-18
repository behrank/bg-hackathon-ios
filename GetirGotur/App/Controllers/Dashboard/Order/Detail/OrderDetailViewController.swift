//
//  OrderDetailViewController.swift
//  GetirGotur
//
//  Created by Behran Kankul on 17.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit
import MapKit

protocol OrderDetailDisplayLogic: class
{
    func prepareUI(post:GGDeliverOptions,user:GGUsers)
}

class OrderDetailViewController: BaseViewController, OrderDetailDisplayLogic
{
    var interactor: OrderDetailBusinessLogic?
    var router: (NSObjectProtocol & OrderDetailRoutingLogic & OrderDetailDataPassing)?

    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!

    @IBOutlet weak var lblAdditionalInfo: UILabel!
    @IBOutlet weak var carryAmount: UILabel!
    
    @IBOutlet weak var lblCountry: UILabel!
    
    @IBOutlet weak var date1: UILabel!
    @IBOutlet weak var date2: UILabel!
    
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
        interactor?.showViewDetails()

    }
    @IBAction func placeAnOrder(_ sender: Any) {
        
    }
}

extension OrderDetailViewController {
    func prepareUI(post:GGDeliverOptions,user:GGUsers) {
        
        imgUser.image = UIImage(named:user.avatarImg!)
        lblUsername.text = user.firstName! + " " + user.lastName!
        date1.text = post.selectedDate!
        date2.text = post.selectedDate2!
        carryAmount.text = post.weight! + " Kg"
        lblCountry.text = countries[post.targetCountry!]
    }
}
