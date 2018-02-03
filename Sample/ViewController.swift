//
//  ViewController.swift
//  Sample
//
//  Created by Ian McDowell on 2/2/18.
//  Copyright © 2018 Ian McDowell. All rights reserved.
//

import UIKit
import TabView

class ViewController: TabViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Tab View"

        // Hide the tab bar when there are 0 or 1 tabs.
        self.hidesSingleTab = true

        // Set the tabs in this tab view
        self.viewControllers = [
            Tab(title: "White", color: .white),
            Tab(title: "Black", color: .black),
            Tab(title: "Red", color: .red),
            Tab(title: "Green", color: .green),
            Tab(title: "Blue", color: .blue),
            Tab(title: "A really long title", color: .blue)
        ]

        // Add a "Add tab" button to the right
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "Add"), style: .plain, target: self, action: #selector(addTab))
        // Add a "Theme Toggle" button to the left
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Theme Toggle", style: .plain, target: self, action: #selector(toggleTheme))
    }

    @objc private func addTab() {
        // Add a new tab and switch to it
        self.activateTab(Tab(title: "New Tab With Title", color: .white))
    }

    @objc private func toggleTheme() {
        // The theme can be changed at any time by setting the `theme` property.
        if type(of: self.theme) == TabViewThemeLight.self {
            self.theme = TabViewThemeDark()
        } else {
            self.theme = TabViewThemeLight()
        }
    }

}

private class Tab: UITableViewController {

    init(title: String, color: UIColor) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        view.backgroundColor = color

        // This view controller's navigation items will be visible next to the tab bar's navigation items.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "\(title) Action", style: .done, target: nil, action: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.tableFooterView = UIView()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
