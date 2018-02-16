//
//  CarrierViewController.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

protocol CarrierDisplayLogic: class
{

}

class CarrierViewController: BaseViewController, CarrierDisplayLogic
{
    var interactor: CarrierBusinessLogic?
    var router: (NSObjectProtocol & CarrierRoutingLogic & CarrierDataPassing)?

  
    @IBOutlet weak var txtCountryName: UITextField!
    @IBOutlet weak var txtCountyName2: UITextField!
    @IBOutlet weak var txtCountyName3: UITextField!
    
    @IBOutlet weak var txtCountryAmount: UITextField!
    @IBOutlet weak var txtCountryAmount2: UITextField!
    @IBOutlet weak var txtCountryAmount3: UITextField!
    // MARK: Object lifecycle
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        CarrierWorker().doSetup(self)
    
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        CarrierWorker().doSetup(self)
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
    @IBAction func continueToDashboard(_ sender: Any) {
        if txtCountryName.text == ""
            && txtCountryAmount.text == ""
            && txtCountyName2.text == ""
            && txtCountryAmount2.text == ""
            && txtCountyName3.text == ""
            && txtCountryAmount3.text == "" {
            
            self.showAlert(for: "GetirGötür", and: "En az bir ülke ve kg bilgisi gerekiyor.", isQuestion: false, buttonTitles: ["Tamam"], completion: { _ in
                
            })
            return
        }
        
    }
}

extension CarrierViewController {
    
}
