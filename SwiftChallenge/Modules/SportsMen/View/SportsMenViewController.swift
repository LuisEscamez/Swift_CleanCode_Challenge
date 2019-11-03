//
//  SportsMenTableViewController.swift
//  SwiftChallenge
//
//  Created by Luis on 19/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import UIKit
import PKHUD

class SportsMenViewController: BaseViewController {
    
    var viewModel: SportsMenInterfaceToViewModelProtocol?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        configureTable()
        viewModel?.interfaceIsLoaded()
    }
    
    func bindViewModel() {
        bindLoader()
        bindTableActions()
    }
}


// MARK: - Private Methods
fileprivate extension SportsMenViewController {
    
    func bindLoader() {
        self.viewModel?.showLoaderHud.bind { visible in
            PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
            visible ? PKHUD.sharedHUD.show() : PKHUD.sharedHUD.hide()
        }
    }
    
    func bindTableActions() {
        self.viewModel?.sportsFetched.bind { sportsAreFetched in
            if sportsAreFetched { self.tableView.reloadData() }
        }
    }
    
    func configureTable() {
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        tableView.register(UINib.init(nibName: "PlayerTableViewCell", bundle: nil), forCellReuseIdentifier: PlayerTableViewCell.reuseIdentifier)
    }
}
