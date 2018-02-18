//
//  OrderDetailPresenter.swift
//  GetirGotur
//
//  Created by Behran Kankul on 17.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit
import Marshal

protocol OrderDetailPresentationLogic
{
    func updateUI(postInfo:GGDeliverOptions,userInfo:GGUsers)
}

class OrderDetailPresenter: OrderDetailPresentationLogic
{
    weak var viewController: OrderDetailDisplayLogic?
    
    func updateUI(postInfo:GGDeliverOptions,userInfo:GGUsers)
    {
        viewController?.prepareUI(post:postInfo,user:userInfo)
    }
}
