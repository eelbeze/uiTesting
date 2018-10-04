//
//  App.swift
//  uiTesting
//
//  Created by Elise El beze on 05/09/2018.
//  Copyright © 2018 Elise El beze. All rights reserved.
//

import UIKit

struct App {
    let image: UIImage
    let name: String
    let bundleID: String
    
    init(image: UIImage, name: String, bundleID: String) {
        self.image = image
        self.name = name
        self.bundleID = bundleID
    }
}
