//
//  CarrierInteractor.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

protocol CarrierBusinessLogic
{

}

protocol CarrierDataStore
{

}

class CarrierInteractor: CarrierBusinessLogic, CarrierDataStore
{
    var presenter: CarrierPresentationLogic?
    var worker: CarrierWorker?
  
}
