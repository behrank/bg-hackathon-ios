//
//  MyOrdersModels.swift
//  GetirGotur
//
//  Created by Behran Kankul on 18.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

enum MyOrders
{
    // MARK: Use cases
  
    enum DataModels {
        struct Request
        {
        }
        struct Response
        {
        }
        struct ViewModel
        {
            var data:[GGMyRequests]?
            init(data:[GGMyRequests]){
                self.data = data
            }
        }
    }
}
