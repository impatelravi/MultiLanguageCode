//
//  String+Extension.swift
//  MultiLanguageCode
//
//  Created by Ravi Patel on 14/04/21.
//  Copyright © 2021 Ravi Patel. All rights reserved.
//

import Foundation

extension String {
    var localizedString: String {
        return LocalizationParam.getLocalizedStringFor(key: self)
    }
}
