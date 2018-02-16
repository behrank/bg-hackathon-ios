//
//  OrderedInteractor.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

protocol OrderedBusinessLogic
{

}

protocol OrderedDataStore
{

}

class OrderedInteractor: OrderedBusinessLogic, OrderedDataStore
{
    var presenter: OrderedPresentationLogic?
    var worker: OrderedWorker?
  
}
