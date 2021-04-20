//
//  ViewController.swift
//  MultiLanguageCode
//
//  Created by Ravi Patel on 14/04/21.
//  Copyright © 2021 Ravi Patel. All rights reserved.
//

import UIKit

struct LanguageLabels {
    static var english: String { return "English".localizedString }
    static var hindi: String { return "Hindi".localizedString }
    static var gujarati: String { return "Gujarati".localizedString }
    static var labelDemo: String {return "This is Demo for to show how multi language works".localizedString}
}

struct NotificationObserverKeys {
    static let languageChanged = "languageChanged"
}

extension Notification.Name {
    static let languageChanged = Notification.Name(NotificationObserverKeys.languageChanged)
}

class ViewController: UIViewController {
    //UILabel
    @IBOutlet weak var lblSelectLanguage: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    
    //Local
    var languagesTitleData: [DropDownModel] = []
    private let arrLanguageSelection = ["English", "हिंदी", "ગુજરાતી"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemTeal
        //setLanguageData()
        addObserver()
        lblValue.text = LanguageLabels.labelDemo
    }
    
    /*fileprivate func setLanguageData() {
        languagesTitleData = [DropDownModel(dict: [DropDownModel.Keys.title.rawValue: "Select",
                                                   DropDownModel.Keys.id.rawValue: ""]),
                              DropDownModel(dict: [DropDownModel.Keys.title.rawValue: LanguageLabels.english,
                                                   DropDownModel.Keys.id.rawValue: LanguageLabels.english.lowercased()]),
                              DropDownModel(dict: [DropDownModel.Keys.title.rawValue: LanguageLabels.hindi,
                                                   DropDownModel.Keys.id.rawValue: LanguageLabels.hindi.lowercased()]),
                              DropDownModel(dict: [DropDownModel.Keys.title.rawValue: LanguageLabels.gujarati,
                                                   DropDownModel.Keys.id.rawValue: LanguageLabels.gujarati.lowercased()])]
    }*/
    
    func addObserver() {
        K_NC.addObserver(self, selector: #selector(languageChanged(_:)), name: .languageChanged, object: nil)
    }

    @IBAction func btnSelectLanguageTapped(_ sender: UIButton) {
        StringPickerViewController.show(pickerType: .single, initialSelection: lblSelectLanguage.text, arrSource: [arrLanguageSelection], doneAction: { (rows, value) in
            self.lblSelectLanguage.text = value as? String
            if (self.lblSelectLanguage.text == "हिंदी") {
                selectedLanguage = LanguageCodes.hindi.rawValue
            }
            else if (self.lblSelectLanguage.text == "English") {
                selectedLanguage = LanguageCodes.english.rawValue
            }
            else if (self.lblSelectLanguage.text == "ગુજરાતી") {
                selectedLanguage = LanguageCodes.gujarati.rawValue
            }
            LocalizationParam.getInstance.localizationCode = LanguageCodes(rawValue: selectedLanguage)!
            K_NC.post(name: .languageChanged, object: nil)
        }, animated: true, origin: sender)
    }
    
    @objc private func languageChanged(_ noti: Notification) {
        lblValue.text = LanguageLabels.labelDemo
    }
}

