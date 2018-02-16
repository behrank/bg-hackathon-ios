//
//  PickerWorker.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

class PickerWorker
{
    func doSetup(_ viewController : PickerViewController) {
        let interactor = PickerInteractor()
        let presenter = PickerPresenter()
        let router = PickerRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
