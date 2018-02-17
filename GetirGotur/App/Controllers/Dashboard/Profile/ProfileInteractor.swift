//
//  ProfileInteractor.swift
//  GetirGotur
//
//  Created by Behran Kankul on 17.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

protocol ProfileBusinessLogic
{

}

protocol ProfileDataStore
{

}

class ProfileInteractor: ProfileBusinessLogic, ProfileDataStore
{
    var presenter: ProfilePresentationLogic?
    var worker: ProfileWorker?
  
}
