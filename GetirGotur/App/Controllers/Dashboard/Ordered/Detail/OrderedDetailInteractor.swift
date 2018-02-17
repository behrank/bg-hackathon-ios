//
//  OrderedDetailInteractor.swift
//  GetirGotur
//
//  Created by Behran Kankul on 17.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

protocol OrderedDetailBusinessLogic
{

}

protocol OrderedDetailDataStore
{

}

class OrderedDetailInteractor: OrderedDetailBusinessLogic, OrderedDetailDataStore
{
    var presenter: OrderedDetailPresentationLogic?
    var worker: OrderedDetailWorker?
  
}
