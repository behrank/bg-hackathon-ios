//
//  OrderedRouter.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

@objc protocol OrderedRoutingLogic
{
    func routeToDetail()
}

protocol OrderedDataPassing
{
    var dataStore: OrderedDataStore? { get }
}

class OrderedRouter: NSObject, OrderedRoutingLogic, OrderedDataPassing
{
    weak var viewController: OrderedViewController?
    var dataStore: OrderedDataStore?
    
    //MARK : Routing
    func routeToDetail(){
        let destination = OrderedDetailViewController.fromStoryboard(.orderedDetail)
        viewController?.navigationController?.pushViewController(destination, animated: true)
        
    }
}
