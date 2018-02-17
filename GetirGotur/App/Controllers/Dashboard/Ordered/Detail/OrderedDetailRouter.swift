//
//  OrderedDetailRouter.swift
//  GetirGotur
//
//  Created by Behran Kankul on 17.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

@objc protocol OrderedDetailRoutingLogic
{

}

protocol OrderedDetailDataPassing
{
    var dataStore: OrderedDetailDataStore? { get }
}

class OrderedDetailRouter: NSObject, OrderedDetailRoutingLogic, OrderedDetailDataPassing
{
    weak var viewController: OrderedDetailViewController?
    var dataStore: OrderedDetailDataStore?
    
    //MARK : Routing
    
}
