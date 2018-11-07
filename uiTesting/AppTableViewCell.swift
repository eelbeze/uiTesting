//
//  AppTableViewCell.swift
//  uiTesting
//
//  Created by Elise El beze on 05/09/2018.
//  Copyright © 2018 Elise El beze. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "reuseIdentifier"
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
}
