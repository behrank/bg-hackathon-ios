//
//  NotificationsInteractor.swift
//  GetirGotur
//
//  Created by Behran Kankul on 18.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

protocol NotificationsBusinessLogic
{

}

protocol NotificationsDataStore
{

}

class NotificationsInteractor: NotificationsBusinessLogic, NotificationsDataStore
{
    var presenter: NotificationsPresentationLogic?
    var worker: NotificationsWorker?
  
}
