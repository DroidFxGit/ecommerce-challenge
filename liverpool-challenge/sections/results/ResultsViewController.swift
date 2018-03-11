//
//  ResultsViewController.swift
//  liverpool-challenge
//
//  Created by Carlos Vázquez Gómez on 3/10/18.
//  Copyright © 2018 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var adapter:ResultsCollectionViewAdapter?
    var searchString: String?
    
    lazy var viewModel: MainSeachViewModel = {
        return MainSeachViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = searchString
        adapter = ResultsCollectionViewAdapter(collectionView: collectionView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.showProgressHUD()
        fetchResults()
    }

    func fetchResults() {
        guard let string = searchString else {return}
        viewModel.fetchProducts(_with: string) {[weak self] (data, error) in
            if data != nil {
                self?.finishLoadingHUD(.success)
            }
            else {
                self?.finishLoadingHUD(.error)
            }
            self?.collectionView.reloadData()
        }
    }
}

extension ResultsViewController: ViewControllerProtocol {
    var presenterView: UIView? {
        get {
            return self.navigationController?.view
        }
    }
    
    var collection: UICollectionView? {
        get {
            return self.collectionView
        }
    }
    
}
