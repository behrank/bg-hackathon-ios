//
//  PickerRouter.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

@objc protocol PickerRoutingLogic
{

}

protocol PickerDataPassing
{
    var dataStore: PickerDataStore? { get }
}

class PickerRouter: NSObject, PickerRoutingLogic, PickerDataPassing
{
    weak var viewController: PickerViewController?
    var dataStore: PickerDataStore?
    
    //MARK : Routing
    
}
