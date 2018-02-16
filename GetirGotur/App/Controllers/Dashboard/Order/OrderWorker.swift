//
//  OrderWorker.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

class OrderWorker
{
    func doSetup(_ viewController : OrderViewController) {
        let interactor = OrderInteractor()
        let presenter = OrderPresenter()
        let router = OrderRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
