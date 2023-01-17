//
//  HeadLinesViews.swift
//  GetNews
//
//  Created by emre usul on 16.01.2023.
//

import UIKit

struct HeadlinesView {
    
    //MARK: - HeadlinesViewController
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HeadlineTableViewCell.self, forCellReuseIdentifier: HeadlineTableViewCell.identifier)
        return tableView
    }()
    

}

