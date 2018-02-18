//
//  MyOrdersInteractor.swift
//  GetirGotur
//
//  Created by Behran Kankul on 18.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

protocol MyOrdersBusinessLogic
{

}

protocol MyOrdersDataStore
{

}

class MyOrdersInteractor: MyOrdersBusinessLogic, MyOrdersDataStore
{
    var presenter: MyOrdersPresentationLogic?
    var worker: MyOrdersWorker?
  
}
