//
//  OrderedDetailWorker.swift
//  GetirGotur
//
//  Created by Behran Kankul on 17.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

class OrderedDetailWorker
{
    func doSetup(_ viewController : OrderedDetailViewController) {
        let interactor = OrderedDetailInteractor()
        let presenter = OrderedDetailPresenter()
        let router = OrderedDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
