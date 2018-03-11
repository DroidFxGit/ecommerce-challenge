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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.showProgressHUD()
        fetchResults()
    }

    func fetchResults() {
        guard let string = searchString else {return}
        viewModel.fetchProducts(_with: string) {[weak self] (products, error) in
            if products != nil {
                self?.finishLoadingHUD(.success)
                self?.adapter = ResultsCollectionViewAdapter(collectionView: (self?.collectionView)!, products: products!)
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
