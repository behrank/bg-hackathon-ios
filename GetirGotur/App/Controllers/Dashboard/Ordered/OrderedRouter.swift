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
    
}
