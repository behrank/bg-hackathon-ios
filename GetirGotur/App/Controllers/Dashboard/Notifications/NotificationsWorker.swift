//
//  NotificationsWorker.swift
//  GetirGotur
//
//  Created by Behran Kankul on 18.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

class NotificationsWorker
{
    func doSetup(_ viewController : NotificationsViewController) {
        let interactor = NotificationsInteractor()
        let presenter = NotificationsPresenter()
        let router = NotificationsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
