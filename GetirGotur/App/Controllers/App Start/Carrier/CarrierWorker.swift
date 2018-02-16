//
//  CarrierWorker.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

class CarrierWorker
{
    func doSetup(_ viewController : CarrierViewController) {
        let interactor = CarrierInteractor()
        let presenter = CarrierPresenter()
        let router = CarrierRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
