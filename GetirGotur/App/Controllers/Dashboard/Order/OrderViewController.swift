//
//  OrderViewController.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

protocol OrderDisplayLogic: class
{

}

class OrderViewController: BaseViewController, OrderDisplayLogic
{
    var interactor: OrderBusinessLogic?
    var router: (NSObjectProtocol & OrderRoutingLogic & OrderDataPassing)?

    // MARK: Object lifecycle
  
    @IBOutlet weak var tableView: UITableView!
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        OrderWorker().doSetup(self)
    
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        OrderWorker().doSetup(self)
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

extension OrderViewController {
    
}
extension OrderViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.deliveries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPost", for: indexPath)
        let cellData = DataManager.shared.deliveries[indexPath.row]
        let userInfo = DataManager.shared.users.filter({$0.userId == cellData.senderUserId}).first!
        let imgUser = cell.viewWithTag(1) as! UIImageView
        imgUser.image = UIImage(named:userInfo.avatarImg!)
        imgUser.cornerRadius = 14
        
        let userName = cell.viewWithTag(2) as! UILabel
        userName.text = userInfo.firstName! + " " + userInfo.lastName!
       let country = cell.viewWithTag(3) as! UILabel
        country.text = countries[cellData.targetCountry!]
        let weight = cell.viewWithTag(4) as! UILabel
        weight.text = cellData.weight!
        let date1 = cell.viewWithTag(5) as! UILabel
        date1.text = cellData.selectedDate!
        let date2 = cell.viewWithTag(6) as! UILabel
        date2.text = cellData.selectedDate2!
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToDetail()
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
