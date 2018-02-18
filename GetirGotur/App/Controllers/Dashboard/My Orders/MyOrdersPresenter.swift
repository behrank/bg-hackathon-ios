//
//  MyOrdersPresenter.swift
//  GetirGotur
//
//  Created by Behran Kankul on 18.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

protocol MyOrdersPresentationLogic
{
    func displayMyOrders(viewData:MyOrders.DataModels.ViewModel)
}

class MyOrdersPresenter: MyOrdersPresentationLogic
{
    weak var viewController: MyOrdersDisplayLogic?
    func displayMyOrders(viewData:MyOrders.DataModels.ViewModel){
        viewController?.displayOrders(viewData:viewData)
    }
}
