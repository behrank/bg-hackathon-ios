//
//  Globals.swift
//  Near
//
//  Created by Behran Kankul on 3.02.2018.
//  Copyright © 2018 Be Mobile. All rights reserved.
//

import Foundation
import UIKit

enum Storyboard : String {
    
    //These are the Storyboard names
    case main = "Main"
    case landing = "Landing"

    enum Identifier : String {
        
        //These are the ViewController Storyboard Identifiers
        case empty = ""
        case landing = "landingVC"
        case dashboard = "dashboardVC"
        
        //Storyboards owning viewcontrollers
        var storyboardName : Storyboard {
            switch self {
            case .landing,.dashboard:
                return .main
            default: return .main
            }
        }
    }
}

var kIndexPathPointer = "kIndexPathPointer"


enum CornerRadius:CGFloat {
    case normal = 4
    case medium = 9
    case profileImage = 16
}

enum TagColors {
    case purple //#8053c9
    case blue //#2d9ccc
    case gray //#c7c7c7
    case red //#c95353
    case facebook //#295cab
    case smoothRed //#ff6666
    case smoothYellow //#ffcc00
    case green
    case lightBlue
    case Blue
    case LightBlue
    case Red //e80051
    case Grey //C2C2C6
    case Green //#569c4e
    case Yellow
    case Purple
    case dark
    //dark  40424E , blue  3495C5
    func toUIColor() -> UIColor {
        
        switch self {
        case .Blue:
            return UIColor(red:0.25, green:0.60, blue:0.97, alpha:1.0)
        case .LightBlue:
            return UIColor(red:0.00, green:0.76, blue:0.88, alpha:1.0)
        case .Red:
            return UIColor(red:0.90, green:0.00, blue:0.32, alpha:1.0)
        case .Grey:
            return UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        case .Green:
            return UIColor(red:0.34, green:0.61, blue:0.31, alpha:1.0)
        case .Purple:
            return UIColor(red:0.51, green:0.04, blue:0.96, alpha:1.0)
        case .Yellow:
            return UIColor(red:0.95, green:0.77, blue:0.00, alpha:1.0)
        case .blue:
            return UIColor(red:0.18, green:0.61, blue:0.80, alpha:1.0)
        case .facebook:
            return UIColor(red:0.16, green:0.36, blue:0.67, alpha:1.0)
        case .red:
            return UIColor(red:0.79, green:0.33, blue:0.33, alpha:1.0)
        case .gray:
            return UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0)
        case .purple:
            return UIColor(red:0.50, green:0.33, blue:0.79, alpha:1.0)
        case .smoothRed:
            return UIColor(red:1.0, green:0.4, blue:0.4, alpha:1.0)
        case .smoothYellow:
            return UIColor(red:1.0, green:0.8, blue:0.0, alpha:1.0)
        case .green:
            return UIColor(red:0.34, green:0.61, blue:0.31, alpha:1.0)
        case .lightBlue:
            return UIColor(red:0.00, green:0.76, blue:0.88, alpha:1.0)
        case .dark:
            return UIColor(red:0.25, green:0.26, blue:0.31, alpha:1.0)
        }
    }
}
