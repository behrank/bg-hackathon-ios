//
//  LandingRouter.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

@objc protocol LandingRoutingLogic
{

}

protocol LandingDataPassing
{
    var dataStore: LandingDataStore? { get }
}

class LandingRouter: NSObject, LandingRoutingLogic, LandingDataPassing
{
    weak var viewController: LandingViewController?
    var dataStore: LandingDataStore?
    
    //MARK : Routing
    
}
