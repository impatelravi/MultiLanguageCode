//
//  ConfigurationConstant.swift
//  SharkID
//
//  Created by Vikram Jagad on 25/02/19.
//  Copyright © 2019 sttl. All rights reserved.
//

//http://192.168.0.72:5000/api/app/

import UIKit

//MARK:- Common Use for all

//MARK:- Devices Type
let IS_IPAD = (UIDevice.current.userInterfaceIdiom == .pad)
let IS_IPHONE = (UIDevice.current.userInterfaceIdiom == .phone)
let osVersion = UIDevice.current.systemVersion

//MARK:- Get Devices Width and Height
let SCREEN_WIDTH = CGFloat(UIScreen.main.bounds.size.width)
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let SCREEN_MIN_LENGTH = min(SCREEN_WIDTH, SCREEN_HEIGHT)
let IS_IPHONE_4_OR_LESS = (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
let IS_IPHONE_5 = (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
let IS_IPHONE_6 = (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
let IS_IPHONE_6P = (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
let IS_IPHONE_X = (IS_IPHONE && SCREEN_HEIGHT >= 812.0)

var bottomMarginFromSafeArea: CGFloat {
    if #available(iOS 11.0, *)
    {
        return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
    }
    return 0
}

let IS_IPHONE_WITH_NOTCH = (IS_IPHONE && STATUS_BAR_HEIGHT > 20)
let IPAD_MARGIN: CGFloat = 70

var STATUS_BAR_HEIGHT : CGFloat {
    return UIApplication.shared.statusBarFrame.height
}

//MARK:- DeviceID
//let DeviceID = UIDevice.current.identifierForVendor!.uuidString //"75a30533aaaa87b"

//MARK:- StoryBoard
let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)

//MARK:- NotificationCenter
let K_NC = NotificationCenter.default

//MARK:- AppDelegates instances
let appDelegate = UIApplication.shared.delegate as! AppDelegate

@available(iOS 13.0, *)
let sceneDelegate = (UIApplication.shared.connectedScenes.first)?.delegate as! SceneDelegate

//MARK:- DeviceID
//let DeviceID = Global.uniQueID()

//MARK:- TableView
let groupTablePadding: CGFloat = 35

let ALPHABETS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let ALPHABETS_SPACE = "\(ALPHABETS) "
let NUMERIC = "1234567890"
let NUMERIC_SPACE = "\(NUMERIC) "
let NUMERIC_AMOUNT = "1234567890."
let ALPHABETS_NUMERIC = "\(ALPHABETS)\(NUMERIC)"
let ALPHABETS_NUMERIC_SPACE = "\(ALPHABETS)\(NUMERIC) "
let ALLOWED_SPECIAL_CHARACTER = "&@._-'/"

let MOBILE_LENGTH_VALIDATION = 10
let LANDLINE_LENGTH_VALIDATION = 8
let PINCODE_LENGTH_VALIDATION = 6
let OTP_LENGTH = 6
let PAN_CARD_LENGTH = 10

let k_address_Length = 300

let splash_screen = "splash_screen"
var selectedLanguage = LanguageCodes.english.rawValue

//MARK:- Year
/*var dateOfBirthMinimumDate : Date? {
    return DateConverter.getDateFromDateString(aDateString: "01/01/1900", inputFormat: DateFormats.dd_MM_yyyy)
}*/
