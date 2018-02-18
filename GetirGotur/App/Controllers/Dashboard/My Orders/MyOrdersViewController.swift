//
//  MyOrdersViewController.swift
//  GetirGotur
//
//  Created by Behran Kankul on 18.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

protocol MyOrdersDisplayLogic: class
{
    func displayOrders(viewData:MyOrders.DataModels.ViewModel)
}

class MyOrdersViewController: BaseViewController, MyOrdersDisplayLogic
{
    var interactor: MyOrdersBusinessLogic?
    var router: (NSObjectProtocol & MyOrdersRoutingLogic & MyOrdersDataPassing)?

    @IBOutlet weak var tableView: UITableView!
    // MARK: Object lifecycle
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        MyOrdersWorker().doSetup(self)
    
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        MyOrdersWorker().doSetup(self)
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
        interactor?.prepareMyOrders()
    }
}
extension MyOrdersViewController {
    func displayOrders(viewData:MyOrders.DataModels.ViewModel) {
        tableView.reloadData()
    }
}
extension MyOrdersViewController:UITabBarDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return DataManager.shared.myorders.count
        }
        else{
            return 0
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Getirdiklerin"
        }
        else{
            return "Götürdüklerin"
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPost", for: indexPath)
        let cellData = DataManager.shared.myorders[indexPath.row]
        let userInfo = DataManager.shared.users.filter({$0.userId == cellData.senderUserId}).first!
        let imgUser = cell.viewWithTag(1) as! UIImageView
        imgUser.image = UIImage(named:userInfo.avatarImg!)
        imgUser.cornerRadius = 14
        
        let userName = cell.viewWithTag(2) as! UILabel
        userName.text = userInfo.firstName! + " " + userInfo.lastName!
        let country = cell.viewWithTag(3) as! UILabel
        country.text = countries[cellData.targetCountry!]
        let productName = cell.viewWithTag(4) as! UILabel
        productName.text = cellData.requestTitle!
        let date1 = cell.viewWithTag(5) as! UILabel
        date1.text = cellData.selectedDate!
        let status = cell.viewWithTag(6) as! UILabel
        if cellData.status! == 1 {
            status.text = "Beklemede"
        }
        else if cellData.status! == 2 {
            status.text = "Yolda"
            status.borderColor = TagColors.green.toUIColor()
            status.textColor = TagColors.green.toUIColor()


        }
        else {
            status.text = "Tamamlandı"
            status.borderColor = TagColors.red.toUIColor()
            status.textColor = TagColors.red.toUIColor()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: false)
    }
}
