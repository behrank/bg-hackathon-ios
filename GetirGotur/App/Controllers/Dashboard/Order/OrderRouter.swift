//
//  OrderRouter.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

@objc protocol OrderRoutingLogic
{
    func routeToDetail()
}

protocol OrderDataPassing
{
    var dataStore: OrderDataStore? { get }
}

class OrderRouter: NSObject, OrderRoutingLogic, OrderDataPassing
{
    weak var viewController: OrderViewController?
    var dataStore: OrderDataStore?
    
    //MARK : Routing
    func routeToDetail(){
        let destination = OrderDetailViewController.fromStoryboard(.orderDetail)
        viewController?.navigationController?.pushViewController(destination, animated: true)
        
    }
}
