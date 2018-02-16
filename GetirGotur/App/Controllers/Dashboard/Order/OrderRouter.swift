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
    
}
