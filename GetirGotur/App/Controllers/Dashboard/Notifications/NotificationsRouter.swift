//
//  NotificationsRouter.swift
//  GetirGotur
//
//  Created by Behran Kankul on 18.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

@objc protocol NotificationsRoutingLogic
{

}

protocol NotificationsDataPassing
{
    var dataStore: NotificationsDataStore? { get }
}

class NotificationsRouter: NSObject, NotificationsRoutingLogic, NotificationsDataPassing
{
    weak var viewController: NotificationsViewController?
    var dataStore: NotificationsDataStore?
    
    //MARK : Routing
    
}
