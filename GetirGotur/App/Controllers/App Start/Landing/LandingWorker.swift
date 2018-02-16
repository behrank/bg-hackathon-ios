//
//  LandingWorker.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

class LandingWorker
{
    func doSetup(_ viewController : LandingViewController) {
        let interactor = LandingInteractor()
        let presenter = LandingPresenter()
        let router = LandingRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
