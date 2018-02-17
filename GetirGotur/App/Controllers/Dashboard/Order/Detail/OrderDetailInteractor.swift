//
//  OrderDetailInteractor.swift
//  GetirGotur
//
//  Created by Behran Kankul on 17.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

protocol OrderDetailBusinessLogic
{

}

protocol OrderDetailDataStore
{

}

class OrderDetailInteractor: OrderDetailBusinessLogic, OrderDetailDataStore
{
    var presenter: OrderDetailPresentationLogic?
    var worker: OrderDetailWorker?
  
}
