//
//  OrderDetailWorker.swift
//  GetirGotur
//
//  Created by Behran Kankul on 17.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

class OrderDetailWorker
{
    func doSetup(_ viewController : OrderDetailViewController) {
        let interactor = OrderDetailInteractor()
        let presenter = OrderDetailPresenter()
        let router = OrderDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
