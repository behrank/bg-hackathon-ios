//
//  LandingInteractor.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

protocol LandingBusinessLogic
{

}

protocol LandingDataStore
{

}

class LandingInteractor: LandingBusinessLogic, LandingDataStore
{
    var presenter: LandingPresentationLogic?
    var worker: LandingWorker?
  
}
