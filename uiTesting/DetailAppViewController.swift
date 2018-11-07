//
//  DetailAppViewController.swift
//  uiTesting
//
//  Created by Elise El beze on 17/10/2018.
//  Copyright © 2018 Elise El beze. All rights reserved.
//

import UIKit

class DetailAppViewController: UIViewController {
    
    // MARK: - Properties
    
    static let segueIdentifier = "detailSegue"
    
    var app: App?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = app?.name
        detailLabel.text = app?.bundleID
        descriptionLabel.text = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer erat ipsum, finibus nec erat sit amet, porta dignissim tortor.
        Cras venenatis faucibus convallis. In pharetra purus et bibendum sagittis.
        """
        imageView.image = app?.image
        imageView.layer.cornerRadius = 15
        navigationItem.largeTitleDisplayMode = .never
    }
}
