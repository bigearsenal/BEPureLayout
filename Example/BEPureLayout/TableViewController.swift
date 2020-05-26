//
//  TableViewController.swift
//  BEPureLayout_Example
//
//  Created by Chung Tran on 5/26/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import BEPureLayout

class MyTableHeaderView: BETableHeaderView {
    lazy var label = UILabel(text: "TableViewHeaderView is loading...", textSize: 20, weight: .bold, textColor: .black, numberOfLines: 0)
    
    override func commonInit() {
        super.commonInit()
        
        addSubview(label)
        label.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16))
    }
}

class TableViewController: BaseViewController {
    lazy var tableView = UITableView(forAutoLayout: ())
    
    // Data model: These strings will be the data for the table view cells
    let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]

    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    override func setUp() {
        super.setUp()
        view.addSubview(tableView)
        tableView.autoPinEdgesToSuperviewEdges()
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
//        tableView.delegate = self
        tableView.dataSource = self
        
        let tableHeaderView = MyTableHeaderView(tableView: tableView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.transition(with: tableHeaderView, duration: 0.3, options: .layoutSubviews, animations: {
                tableHeaderView.label.text =
                """
                TableHeaderView was loaded

                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

                """
            })
        }
    }
}

extension TableViewController: UITableViewDataSource {
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count
    }

    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!

        // set the text from the data model
        cell.textLabel?.text = self.animals[indexPath.row]

        return cell
    }
}
