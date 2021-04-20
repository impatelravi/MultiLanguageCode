//
//  LocalizationInteractor.swift
//  MultiLanguageCode
//
//  Created by Ravi Patel on 14/04/21.
//  Copyright © 2021 Ravi Patel. All rights reserved.
//

import Foundation


enum LanguageCodes : String{
    case english = "english"
    case hindi = "hindi"
    case gujarati = "gujarati"
    
    var plistName : String {
        switch self {
        case .english: return "EnglishLocalization"
        case .hindi : return "HindiLocalization"
        case .gujarati : return "GujaratiLocalization"
        }
    }
}

class LocalizationParam{
    static var getInstance = LocalizationParam()
    
    var localizationDict : NSMutableDictionary = [:]
    var localizationPlistName : String = ""
    var localizationCode : LanguageCodes = LanguageCodes.english
    {
        didSet {
            self.localizationPlistName = localizationCode.plistName
            let path: String = Bundle.main.path(forResource: self.localizationPlistName, ofType: "plist")!
            self.localizationDict = NSMutableDictionary(contentsOfFile: path)!
        }
    }
    
    static func getLocalizedStringFor(key : String) -> String{
        if let value = LocalizationParam.getInstance.localizationDict[key] as? String{
            return value
        }
        return ""
    }
    
    static func getLocalizedArrayFor(key : String) -> [String]{
        if let value = LocalizationParam.getInstance.localizationDict[key] as? [String]{
            return value
        }
        return [""]
    }
}

class LoocalizedStrings {
    
    static func getLocalizedStringFor(key : String) -> String{
        if let value = LocalizationParam.getInstance.localizationDict[key] as? String{
            return value
        }
        return ""
    }
}
