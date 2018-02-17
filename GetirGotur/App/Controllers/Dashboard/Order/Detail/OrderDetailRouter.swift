//
//  OrderDetailRouter.swift
//  GetirGotur
//
//  Created by Behran Kankul on 17.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

@objc protocol OrderDetailRoutingLogic
{

}

protocol OrderDetailDataPassing
{
    var dataStore: OrderDetailDataStore? { get }
}

class OrderDetailRouter: NSObject, OrderDetailRoutingLogic, OrderDetailDataPassing
{
    weak var viewController: OrderDetailViewController?
    var dataStore: OrderDetailDataStore?
    
    //MARK : Routing
    
}
