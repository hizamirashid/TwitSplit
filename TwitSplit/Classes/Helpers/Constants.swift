//
//  Constants.swift
//  TwitSplit
//
//  Created by Massive Infinity on 17/1/19.
//  Copyright © 2019 Hizami Rashid. All rights reserved.
//

import Foundation
import UIKit

enum Env {
    case development
    case staging
    case production
}

struct Constants {
    
    // Only change the bundle ID in the plist from DEV to PROD modes.
    struct Deployment {
        static let prodBundleID = "com.hizamirashid.gb.twitsplit"
        static let devBundleID = "com.hizamirashid.gb.twitsplit.dev"
        static let stgBundleID = "com.hizamirashid.gb.twitsplit.staging"
        
        static func environment() -> Env {
            switch Constants.App.bundleId {
            case prodBundleID:
                return Env.production
            case stgBundleID:
                return Env.staging
            case devBundleID:
                return Env.development
            default:
                return Env.development
            }
        }
    }
    
    struct API {
        static let developmentURL = ""
        static let stagingURL = ""
        static let productionURL = ""
        static let headerKey = ""
        static let ktokenID = "kTokenID"
        
        static func baseURL() -> String {
            switch Constants.Deployment.environment() {
            case Env.production:
                return productionURL
            case Env.staging:
                return stagingURL
            case Env.development:
                return developmentURL
            default:
                return developmentURL
            }
        }
    }
    
    struct Device {
        static let osType = "ios"
        static let osVersion = UIDevice.current.systemVersion
        static let isIPhone = (UIDevice.current.userInterfaceIdiom == .phone)
        static let isIPad = (UIDevice.current.userInterfaceIdiom == .pad)
        static let isIPhone5OrLess = (isIPhone && screenMaxLength <= 568.0)
        static let screenScale = UIScreen.main.scale
        static let screenHeight = UIScreen.main.bounds.size.height
        static let screenWidth = UIScreen.main.bounds.size.width
        static let screenMaxLength = max(screenWidth, screenHeight)
        static let screenMinLength = min(screenWidth, screenHeight)
    }
    
    struct App {
        static let bundleId = Bundle.main.bundleIdentifier
        static let name = Bundle.main.object(forInfoDictionaryKey:"CFBundleDisplayName")! as! String
        static let version = Bundle.main.object(forInfoDictionaryKey:"CFBundleShortVersionString")! as! String
        static let build = Bundle.main.object(forInfoDictionaryKey:"CFBundleVersion")! as! String
    }
    
    struct Storyboard {
        static let splash = "Splash"
        static let login = "Login"
        static let user = "User"
        static let spacer = "Spacer"
        static let rewards = "Rewards"
        static let home = "Home"
        static let settings = "Settings"
    }
    
    struct Sizes {
        
    }
    
    struct Segue {
        
    }
    
    struct Titles {
        static let error = "Error"
        static let successful = "Successful"
        static let warning = "Warning"
    }
    
    struct Buttons {
        static let ok = "OK"
        static let cancel = "Cancel"
        static let yes = "YES"
        static let no = "NO"
    }
    
    struct Logs {
        static let jsonParsingStatusMessageError = "Error in parsing status or message"
        static let jsonParsingResonseDataError = "Error in parsing response data"
        static let jsonConvertingError = "Error in converting JSON to data to object model"
    }
    
    struct Keys {
        
    }
    
    struct Placeholders {
        
    }
    
    struct Messages {
        static let loading = "Please Wait..."
        static let apiError = "There was an error in the server. Please try again later."
        static let connectionError = "There is no internet connection. Please try again later."
        static let invalidEmailError = "Email format is invalid."
        static let emptyFieldsError = "Please fill-up all the fields."
        static let emptyCountryField = "Please select country"
        static let invalidConfirmPassword = "The password you entered does not match."
        static let exitSpacerSetupError = "Are you sure you want to exit the Spacer setup?"
        static let deleteSessionSchedule = "Are you sure you want to delete this session?"
        static let identicalSession = "Session timings cannot be identical. Please input another time."
        
        static func emptyFieldsErrorSpecific(field : String)-> String {
            return "Please enter \(field)."
        }
        
        static func emptyChildFieldsErrorSpecific(field : String)-> String {
            return "Please enter your child's \(field)."
        }
    }
    
    struct Colors {
        static let redError = 0xd42027
    }
    
    struct Content {
        
    }
}
