//
//  MyOrdersRouter.swift
//  GetirGotur
//
//  Created by Behran Kankul on 18.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

@objc protocol MyOrdersRoutingLogic
{

}

protocol MyOrdersDataPassing
{
    var dataStore: MyOrdersDataStore? { get }
}

class MyOrdersRouter: NSObject, MyOrdersRoutingLogic, MyOrdersDataPassing
{
    weak var viewController: MyOrdersViewController?
    var dataStore: MyOrdersDataStore?
    
    //MARK : Routing
    
}
