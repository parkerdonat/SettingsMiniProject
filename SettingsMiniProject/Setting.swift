//
//  Setting.swift
//  SettingsMiniProject
//
//  Created by Parker Donat on 4/13/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation
import UIKit

class Setting {
    var image: UIImage?
    let name: String
    var isSet: Bool
    
    init(image: UIImage?, name: String, isSet: Bool) {
        self.image = image
        self.name = name
        self.isSet = isSet
    }
}