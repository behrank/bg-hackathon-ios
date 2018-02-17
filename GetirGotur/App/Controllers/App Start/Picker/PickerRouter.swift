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
    func routeToDashboard()
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
    func routeToDashboard() {
        let destination = BaseTabBarController.fromStoryboard(.dashboard)
        viewController?.navigationController?.pushViewController(destination, animated: true)
    }

}
