//
//  AppTableViewController.swift
//  uiTesting
//
//  Created by Elise El beze on 05/09/2018.
//  Copyright © 2018 Elise El beze. All rights reserved.
//

import UIKit

class AppTableViewController: UITableViewController {
    var apps: [App] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        apps = [
            App(image: UIImage(named: "iconAskBob")!, name: "AskBob", bundleID: "com.octo.askbob"),
            App(image: UIImage(named: "iconTrello")!, name: "Trello", bundleID: "com.fogcreek.trello"),
            App(image: UIImage(named: "iconSlack")!, name: "Slack", bundleID: "com.tinyspeck.chatlyio"),
            App(image: UIImage(named: "iconSwiftShot")!, name: "Swift Shot", bundleID: "com.apple.swiftShot"),
            App(image: UIImage(named: "iconOctoLoco")!, name: "OCTOLoco", bundleID: "com.octo.octoLoco"),
            App(image: UIImage(named: "iconAppaloosa")!, name: "Appaloosa", bundleID: "com.appaloosa.agent"),
            App(image: UIImage(named: "iconStore")!, name: "Store", bundleID: "com.appaloosa.store")
        ]
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? AppTableViewCell else {
            return tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        }
        
        configure(cell: cell, at: indexPath)
        return cell
    }
    
    private func configure(cell: AppTableViewCell, at indexPath: IndexPath) {
        cell.title.text = apps[indexPath.row].name
        cell.detail.text = apps[indexPath.row].bundleID
        
        cell.iconImage?.layer.masksToBounds = true
        cell.iconImage?.layer.cornerRadius = 15
        cell.iconImage.image = apps[indexPath.row].image
    }
}
