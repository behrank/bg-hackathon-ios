//
//  OrderedWorker.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

class OrderedWorker
{
    func doSetup(_ viewController : OrderedViewController) {
        let interactor = OrderedInteractor()
        let presenter = OrderedPresenter()
        let router = OrderedRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
