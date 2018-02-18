//
//  OrderedDetailPresenter.swift
//  GetirGotur
//
//  Created by Behran Kankul on 17.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit
import Marshal

protocol OrderedDetailPresentationLogic
{
    func updateUI(postInfo:GGDeliveryRequests,userInfo:GGUsers)
}

class OrderedDetailPresenter: OrderedDetailPresentationLogic
{
    weak var viewController: OrderedDetailDisplayLogic?
    func updateUI(postInfo:GGDeliveryRequests,userInfo:GGUsers)
    {
        viewController?.prepareUI(post:postInfo,user:userInfo)
    }
}
