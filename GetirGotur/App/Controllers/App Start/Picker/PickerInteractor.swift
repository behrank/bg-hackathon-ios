//
//  PickerInteractor.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

protocol PickerBusinessLogic
{

}

protocol PickerDataStore
{

}

class PickerInteractor: PickerBusinessLogic, PickerDataStore
{
    var presenter: PickerPresentationLogic?
    var worker: PickerWorker?
  
}
