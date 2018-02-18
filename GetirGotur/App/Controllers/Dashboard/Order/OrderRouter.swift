//
//  OrderRouter.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit
import Marshal

protocol OrderRoutingLogic
{
    func routeToDetail(data:GGDeliverOptions,user:GGUsers)
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
    func routeToDetail(data:GGDeliverOptions,user:GGUsers) {
        let detail = OrderDetailViewController.fromStoryboard(.orderDetail)
        var destination = detail.router!.dataStore!
        passDataToDetail(data: data,user:user, destination: &destination)
        viewController?.navigationController?.pushViewController(detail, animated: true)
    }
    
    // MARK: Passing data
    
    func passDataToDetail(data: GGDeliverOptions,user:GGUsers ,destination: inout OrderDetailDataStore)
    {
        destination.postInfo = data
        destination.userInfo = user
    }
}
