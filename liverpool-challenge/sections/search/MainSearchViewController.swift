//
//  MainSearchViewController.swift
//  liverpool-challenge
//
//  Created by Carlos Vázquez Gómez on 3/10/18.
//  Copyright © 2018 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit

class MainSearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchFooterView: SearchFooter!
    
    lazy var searchController: UISearchController = {
        let searchView = UISearchController(searchResultsController: nil)
        searchView.searchResultsUpdater = self
        searchView.obscuresBackgroundDuringPresentation = false
        searchView.searchBar.setDefaultSearchBar()
        
        return searchView
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchController.isActive = true
        searchController.searchBar.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = L10n.string(for: .main_title)
        
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }
        tableView.tableFooterView = searchFooterView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension MainSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
