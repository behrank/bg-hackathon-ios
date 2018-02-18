//
//  OrderedDetailInteractor.swift
//  GetirGotur
//
//  Created by Behran Kankul on 17.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit
import Marshal
protocol OrderedDetailBusinessLogic
{
    func showViewDetails()
}

protocol OrderedDetailDataStore
{
    var postInfo:GGDeliveryRequests? {get set}
    var userInfo:GGUsers? {get set}
}

class OrderedDetailInteractor: OrderedDetailBusinessLogic, OrderedDetailDataStore
{
    var postInfo: GGDeliveryRequests?
    var userInfo:GGUsers?
    
    var presenter: OrderedDetailPresentationLogic?
    var worker: OrderedDetailWorker?
    
    func showViewDetails()
    {
        presenter?.updateUI(postInfo: postInfo!, userInfo: userInfo!)
    }
}
