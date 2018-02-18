//
//  OrderedRouter.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

protocol OrderedRoutingLogic
{
    func routeToDetail(data:GGDeliveryRequests,user:GGUsers)
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
    //MARK : Routing
    func routeToDetail(data:GGDeliveryRequests,user:GGUsers) {
        let detail = OrderedDetailViewController.fromStoryboard(.orderedDetail)
        var destination = detail.router!.dataStore!
        passDataToDetail(data: data,user:user, destination: &destination)
        viewController?.navigationController?.pushViewController(detail, animated: true)
    }
    
    // MARK: Passing data
    
    func passDataToDetail(data: GGDeliveryRequests,user:GGUsers ,destination: inout OrderedDetailDataStore)
    {
        destination.postInfo = data
        destination.userInfo = user
    }
}
