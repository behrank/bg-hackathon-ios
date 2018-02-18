//
//  OrderDetailInteractor.swift
//  GetirGotur
//
//  Created by Behran Kankul on 17.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit
import Marshal

protocol OrderDetailBusinessLogic
{
    func showViewDetails()
}

protocol OrderDetailDataStore
{
    var postInfo:GGDeliverOptions? {get set}
    var userInfo:GGUsers? {get set}
}

class OrderDetailInteractor: OrderDetailBusinessLogic, OrderDetailDataStore
{
    var postInfo: GGDeliverOptions?
    var userInfo: GGUsers?
    var presenter: OrderDetailPresentationLogic?
    var worker: OrderDetailWorker?
    
    func showViewDetails()
    {
        presenter?.updateUI(postInfo: postInfo!, userInfo: userInfo!)
    }
}
