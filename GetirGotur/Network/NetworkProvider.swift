//
//  NetworkProvider.swift
//  GetirGotur
//
//  Created by Behran Kankul on 17.02.2018.
//  Copyright © 2018 KG Teknoloji. All rights reserved.
//

import Foundation
import Moya
import Alamofire

class NetworkProvider {
    
    static let shared = NetworkProvider()
    fileprivate let reachability = NetworkReachabilityManager()
    let provider = MoyaProvider<AppAPI>()
    
    fileprivate init() { }
}

