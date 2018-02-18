//
//  MyOrdersWorker.swift
//  GetirGotur
//
//  Created by Behran Kankul on 18.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

class MyOrdersWorker
{
    func doSetup(_ viewController : MyOrdersViewController) {
        let interactor = MyOrdersInteractor()
        let presenter = MyOrdersPresenter()
        let router = MyOrdersRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    func prepareData() -> MyOrders.DataModels.ViewModel{
        let data = MyOrders.DataModels.ViewModel(data:DataManager.shared.myorders)
        return data
    }
}
