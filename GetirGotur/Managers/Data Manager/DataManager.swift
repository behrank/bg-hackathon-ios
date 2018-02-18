//
//  DataManager.swift
//  GetirGotur
//
//  Created by Behran Kankul on 18.02.2018.
//  Copyright © 2018 KG Teknoloji. All rights reserved.
//

import Foundation
import Marshal

fileprivate class BundleTargetingClass {}

class DataManager {
    static let shared = DataManager()
    
    var users = [GGUsers]()
    var posts = [GGDeliveryRequests]()
    var deliveries = [GGDeliverOptions]()
    var myorders = [GGMyRequests]()
    fileprivate init() {
        setupFakeData()
    }
    
    func printFake(){
//        print(users)
//        print(posts)
//        print(deliveries)
    }
    
    fileprivate func setupFakeData() {
        
        //Fake data source
        let jsoned:[String:Any] = loadJSON(name: "data")!
        let parsedModel = GGResponseModel(object:  jsoned as MarshaledObject)

        users = parsedModel.users!
        posts = parsedModel.deliveryRequests!
        deliveries = parsedModel.deliverOptions!
        myorders = parsedModel.myRequests!
    }
    
    fileprivate func loadJSON<T>(name: String) -> T? {
        guard let filePath = Bundle(for: BundleTargetingClass.self).url(forResource: name, withExtension: "json") else {
            return nil
        }
        
        guard let jsonData = try? Data(contentsOf: filePath, options: .mappedIfSafe) else {
            return nil
        }
        
        guard let json = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) else {
            return nil
        }
        
        return json as? T
    }
    
}
