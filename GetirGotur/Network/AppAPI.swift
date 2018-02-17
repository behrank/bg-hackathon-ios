//
//  AppAPI.swift
//  GetirGotur
//
//  Created by Behran Kankul on 17.02.2018.
//  Copyright © 2018 KG Teknoloji. All rights reserved.
//
import Foundation
import Moya

let apiToken = "1234567890*"

var defaultParameters : [String:Any] = ["userId": "0",
    "token" : apiToken
]

enum AppAPI {
    case getPostsFor(filter: Int, pageIndex:Int,latitude:Double,longitude:Double)
    case updateNotificationToken()
}

enum ResponseTypes:String{
    case Login = "loginMobileUser"
    case UpdateUser = "getUserdata"
    case GetPostData = "getPostData"
}

protocol Loading {
    var needToShowLoading : Bool { get }
}

// MARK: - TargetType Protocol Implementation
extension AppAPI: TargetType {
    
    var baseURL: URL { return URL(string: "https://kripton.yournear.co/api/v1")! }
    var path: String {
        switch self {
        case .getPostsFor(_,_,_,_):
            return "/sync"
        case .updateNotificationToken:
            return "/updateUserToken/"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getPostsFor,.updateNotificationToken:
            return .post
        }
    }
    var task: Task {
        switch self {
 case let .getPostsFor(filter, pageIndex, latitude, longitude):
            
            defaultParameters["lat"] =  latitude
            defaultParameters["lng"] = longitude
            defaultParameters["syncType"] = filter
            defaultParameters["radius"] = "10000"
            defaultParameters["page"] = pageIndex
            return .requestParameters(parameters: defaultParameters, encoding: JSONEncoding.default)
        case .updateNotificationToken:
            defaultParameters["notToken"] =  "1234567890987123456789"
            return .requestParameters(parameters: defaultParameters, encoding: JSONEncoding.default)
        }
    }
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
