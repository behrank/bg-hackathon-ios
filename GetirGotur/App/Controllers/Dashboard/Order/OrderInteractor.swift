//
//  OrderInteractor.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit
import Marshal

protocol OrderBusinessLogic
{

}

protocol OrderDataStore
{
}

class OrderInteractor: OrderBusinessLogic, OrderDataStore
{    
    var presenter: OrderPresentationLogic?
    var worker: OrderWorker?
  
}
