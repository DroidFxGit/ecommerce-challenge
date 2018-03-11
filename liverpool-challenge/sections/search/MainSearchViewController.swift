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
        searchView.searchBar.delegate = self
        searchView.obscuresBackgroundDuringPresentation = false
        searchView.searchBar.setDefaultSearchBar()
        
        return searchView
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.becomeFirstResponder()
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
}

extension MainSearchViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let resultsSearchView = ResultsViewController()
        resultsSearchView.searchString = searchBar.text?.lowercased()
        
        searchController.isActive = false
        tableView.becomeFirstResponder()
        self.navigationController?.pushViewController(resultsSearchView, animated: true)
    }
}
